class tasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # controller actions go in here
  def index
      # get all tasks from the database
      @tasks = task.all
      # render 'tasks/index.html.erb'
  end

  def show
      # Get the task with the given id from the database
      # @task = task.find(params[:id])
      #render the show page (HAPPENS AUTOMATICALLY)
  end

  def new
      # render the new page (HAPPENS AUTOMATICALLY)
      @task = task.new
  end

  # POST /tasks (from the form - data is in params)
  def create
      @task = task.new(task_params)
      @task.save # => true or false
      # redirect to the show page for the task we just created
      redirect_to task_path(@task), status: :see_other
  end

  # GET /tasks/:id/edit
  def edit
      # get the task with the given id from the database
      # @task = task.find(params[:id])
      # render the edit page (HAPPENS AUTOMATICALLY)
  end

  # PATCH /tasks/:id
  def update
      # get the task with the given id from the database
      # @task = task.find(params[:id])
      # update the task with the given params
      @task.update(task_params)
      # redirect to the show page for the task we just updated
      redirect_to task_path(@task), status: :see_other # => show action
  end

  # DELETE /tasks/:id
  def destroy
      # get the task with the given id from the database
      # @task = task.find(params[:id])
      # destroy the task
      @task.destroy
      # redirect to the index page
      redirect_to tasks_path, status: :see_other
  end


  private

  def set_task
      @task = task.find(params[:id])
  end

  def task_params
      # params[:task] # => not permitted
      params.require(:task).permit(:title, :details, :completed) # => permitted
  end
end
