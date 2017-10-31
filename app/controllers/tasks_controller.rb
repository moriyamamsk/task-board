class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    flash[:notice] = "タスクを登録しました。"
    redirect_to root_path
  end
  
  private
  def task_params
    # titleとcontentのみをパラメータとして受け取る
    params.require(:task).permit(:title,:content)
  end
end