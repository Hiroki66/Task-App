class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show, :create, :edit, :update, :destroy]
  before_action :logged_in?, only: [:edit, :update]
  # before_action :admin_or_correct_user, only: [:index, :edit, :update]
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = "新規作成しました"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def index
    @tasks = @user.tasks.order(created_at: :desc)
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.content = params[:content]
    @task.detail = params[:detail]
    if @task.save
      flash[:success] = "編集しました。"
      redirect_to user_tasks_url
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:danger] = "削除しました。"
    redirect_to user_tasks_url
  end

private

  def task_params
    params.require(:task).permit(:content, :detail)
  end

  def set_user
    @user = current_user
  end
  
  def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
  end
end    