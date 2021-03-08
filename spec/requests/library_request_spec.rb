# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe 'Library Request', type: :request do
  context '[GET] /v1/library list library near on location' do
    let!(:libraries_praia_grande) do
      FactoryBot.create(:library, name: 'test praia grande',
                                  latitude: -24.040680,
                                  longitude: -46.513160)
    end
    let!(:libraries_jurema) do
      FactoryBot.create(:library, name: 'test jurema',
                                  latitude: -23.430300,
                                  longitude: -46.517750)
    end
    let!(:libraries_centro_guarulhos) do
      FactoryBot.create(:library, name: 'test guarulhos',
                                  latitude: -23.454338,
                                  longitude: -46.533669)
    end
    before { get '/v1/library', params: params }

    context 'When has librarys near on location' do
      let(:lat) { -23.4508001 }
      let(:lng) { -46.4076736 }

      context 'when parameters not passed correct' do
        context 'when not field latitude in params' do
          let(:params) { { longitude: lng } }

          it 'return 400 bad request' do
            expect(response.status).to eq 400
          end
        end

        context 'when not field longitude in params' do
          let(:params) { { latitude: lat } }

          it 'return 400 bad request' do
            expect(response.status).to eq 400
          end
        end
      end

      context 'when parameters passing correct' do
        let(:params) do
          {
            latitude: lat,
            longitude: lng
          }
        end

        context 'when lat and long is near "guarulhos"' do
          it 'return first library "guarulhos"' do
            body = JSON.parse(response.body)
            body = body.map(&:deep_symbolize_keys)
            expect(body.first[:name]).to eq 'test jurema'
          end
        end

        context 'when lat and long is near "praia grande"' do
          let(:lat) { -24.0077331 }
          let(:lng) { -46.41362050000001 }

          it 'return first library "praia grande"' do
            body = JSON.parse(response.body)
            body = body.map(&:deep_symbolize_keys)
            expect(body.first[:name]).to eq 'test praia grande'
          end
        end

        context 'when lat and long is far and not librarys' do
          let(:lat) { -22.9694417 }
          let(:lng) { -43.1868448 }

          it 'return empty' do
            body = JSON.parse(response.body)
            expect(body).to eq []
          end
        end

        context 'when lat and long is 10km of distance' do
          let(:lat) { -23.4499071 }
          let(:lng) { -46.3658639 }

          it 'return first library "guarulhos"' do
            body = JSON.parse(response.body)
            body = body.map(&:deep_symbolize_keys)
            expect(body.first[:name]).to eq 'test jurema'
          end
        end
      end
    end
  end

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
        expect(response.code).to eq '201'
      end
    end
  end
end
