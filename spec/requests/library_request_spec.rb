# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe 'Library Request', type: :request do
  context '[POST] /v1/library Add a nem library' do
    before { post '/v1/library', params: params }

    context 'When data is okay' do
      let(:params) do
        {
          name: 'Biblioteca Dandara',
          description: 'Biblioteca Comunitaria Dandara',
          image_src: 'https://biblotecadadaria.com.br/login.jpg',
          latitude: -23.0933123,
          longitude: -23.8273928,
          disponible: false
        }
      end

      it 'retorna 200' do
        body = JSON.parse(response.body).deep_symbolize_keys
        expect(body.except(:id, :decimal, :latitude, :longitude)).to eq params.except(:latitude, :longitude)
        expect(response.code).to eq '200'
      end
    end
  end
end
