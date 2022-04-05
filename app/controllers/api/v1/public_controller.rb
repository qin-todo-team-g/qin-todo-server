# frozen_string_literal: true

class Api::V1::PublicController < ApplicationController
  def public
    render json: { message: "Hello from a public endpoint! You don't need to be authenticated to see this." }
  end
end
