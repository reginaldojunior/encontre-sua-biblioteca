# frozen_string_literal: true

module V1
  class LibrariesController < ApplicationController
    def create
      result = Library.create(valid_params)
      render json: result
    end

    private

    def valid_params
      {
        name: request.params[:name],
        description: request.params[:description],
        image_src: request.params[:image_src],
        latitude: request.params[:latitude],
        longitude: request.params[:longitude],
        disponible: 0
      }
    end
  end
end
