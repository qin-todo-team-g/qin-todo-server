# frozen_string_literal: true

class Api::V1::TasksController < ApplicationController
  # TODO: auth0導入後に置き換え
  # before_action :authenticate_user!
  before_action :get_user, only: %i[index create]
  before_action :get_task, only: %i[show update destroy]

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

  def show
    if @task.present?
      render json: {
        task: @task
      }, status: :ok
    else
      render json: {}, status: :no_content
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

  def destroy
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:task_type, :title, :is_done)
  end

  def get_user
    # TODO: auth0導入後に置き換え
    # @user = current_user
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
