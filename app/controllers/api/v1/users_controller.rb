class Api::V1::UsersController < ApplicationController
  include Secured

  def show
    if @user.present?
      render json: {
        user: @user
      }, status: :ok
    else
      render json: {}, status: :no_content
    end
  end

  def update
    if @user.update(user_params)
      render json: {
        user: @user
      }, status: :ok
    else
      render json: {}, status: :internal_server_error
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
