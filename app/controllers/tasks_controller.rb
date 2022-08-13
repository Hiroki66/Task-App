class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show]
  
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
  end
  
  def index
    @tasks = Task.all
    @task = @user.tasks
  end
  
  def show
  end
  
  def edit
    @task = Task.find(params[:task])
  end
  
  def update
    @task.task = params[:task]
    if @post.save
      flash[:notice] = "編集しました。"
      redirect_to tasks_index_url
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "削除しました。"
    redirect_to tasks_index_url
  end
end


def set_user
@user = User.find(params[:user_id])
end