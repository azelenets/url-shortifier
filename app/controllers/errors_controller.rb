# frozen_string_literal: true

# Controller to handle requests to create short URL
class ErrorsController < ApplicationController
  def not_found
    render :not_found, status: 404
  end
end
