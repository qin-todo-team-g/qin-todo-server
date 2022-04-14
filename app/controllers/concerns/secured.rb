# frozen_string_literal: true

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def authenticate_request!
    @auth_payload, @auth_header = auth_token
    @user = User.from_token_payload(@auth_payload)
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def http_token
    return if request.headers['Authorization'].blank?

    request.headers['Authorization'].split.last
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end
end
