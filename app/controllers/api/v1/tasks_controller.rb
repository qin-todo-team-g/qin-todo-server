class Api::V1::TasksController < ApplicationController
  
  def index
    user  = User.find(params[:user_id])
    tasks = user.tasks.all
    if tasks.exists?
      render json: {
        tasks: tasks
      }, status: :ok
    else
      render json: {}, status: :no_content
    end
  end

  def create
    user = User.find(params[:user_id])
    task = user.tasks.build(task_params)
    if task.save
      render json: {
        task: task
      }, status: :created
    else
      render json: {}, status: :internal_server_error
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: {
        task: task
      }, status: :ok
    else
      render json: {}, status: :internal_server_error
    end
  end

  def done
    task = Task.find(params[:id])
    task.toggle(:is_done)
    if task.save
      render json: {
        task: task
      }, status: :ok
    else
      render json: {}, status: :internal_server_error
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
  end

  private

    def task_params
      params.require(:task).permit(:task_type, :title)
    end
end
