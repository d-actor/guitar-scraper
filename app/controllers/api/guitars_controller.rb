class Api::GuitarsController < ApplicationController
  def index
    render json: Guitar.all
  end
end
