class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      user_id: current_user.id
      )
      if @task.save
        flash[:success] = "追加しました"
        redirect_to tasks_index_url
      else
        render :new
      end
  end
  
  def index
    @tasks = Task.all
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @task.user
  end
  
  def edit
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
