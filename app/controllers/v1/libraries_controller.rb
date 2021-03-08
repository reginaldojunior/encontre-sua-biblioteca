# frozen_string_literal: true

module V1
  class LibrariesController < ApplicationController
    DISTANCE_MAXIMUM = 30

    def create
      result = Library.create(valid_params)
      render json: result, status: 201
    end

    def index
      return render json: { error: 'latitude field not found' }, status: 400 if params['latitude'].nil?
      return render json: { error: 'longitude field not found' }, status: 400 if params['longitude'].nil?

      result = Library.within(DISTANCE_MAXIMUM, units: :kms,
                                                origin: [params['latitude'], params['longitude']])
                      .where(disponible: true).limit(10).all
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
