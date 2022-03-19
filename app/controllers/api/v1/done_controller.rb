# frozen_string_literal: true

class Api::V1::DoneController < ApplicationController
  before_action :authenticate_user!

  def update
    task = Task.find(params[:task_id])
    task.toggle(:is_done)
    if task.save
      render json: {
        task: task
      }, status: :ok
    else
      render json: {}, status: :internal_server_error
    end
  end
end
