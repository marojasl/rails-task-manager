class TasksController < ApplicationController

  def index
    @tasks = Task.all
    # @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end
end
