class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    if @task[:completed] == true
      @status = "This task is complete"
    else
      @status = "This task is not complete yet"
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(tasks_params)
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
