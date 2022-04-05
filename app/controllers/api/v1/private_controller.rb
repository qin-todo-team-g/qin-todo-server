# frozen_string_literal: true

class Api::V1::PrivateController < ApplicationController
  include Secured

  def private
    render json: 'Hello from a private endpoint! You need to be authenticated to see this.'
  end
end
