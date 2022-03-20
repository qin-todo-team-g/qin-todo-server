# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user, only: %i[index create]
  before_action :get_task, only: %i[update done destroy]

  def index
    tasks = @user.tasks.all
    if tasks.exists?
      render json: {
        tasks: tasks
      }, status: :ok
    else
      render json: {}, status: :no_content
    end
  end

  def create
    task = @user.tasks.build(task_params)
    if task.save
      render json: {
        task: task
      }, status: :created
    else
      render json: {}, status: :internal_server_error
    end
  end

  def update
    if @task.update(task_params)
      render json: {
        task: @task
      }, status: :ok
    else
      render json: {}, status: :internal_server_error
    end
  end

  def done
    @task.toggle(:is_done)
    if @task.save
      render json: {
        task: @task
      }, status: :ok
    else
      render json: {}, status: :internal_server_error
    end
  end

  def destroy
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:task_type, :title)
  end

  def get_user
    @user = current_user
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
