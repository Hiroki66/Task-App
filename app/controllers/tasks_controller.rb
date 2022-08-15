class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      user_id: current_user.id,
      task: params[:task],
      detail: params[:detail]
      )
      if @task.save
        flash[:success] = "追加しました"
        redirect_to user_tasks_url
      else
        render :new
      end
    # @task = Task.find(params[:id])
  end
  
  def index
    @tasks = Task.all.order(created_at: :desc)
    @task = @user.tasks
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.task = params[:task]
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
end


def set_user
  @user = User.find(params[:user_id])
end