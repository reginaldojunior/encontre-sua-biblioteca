# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'CRUD' do
    let(:library) { FactoryBot.create(:library) }
    let(:update_library) do
      Library.first.update(name: 'Biblioteca Zumbi dos Palmares')
    end

    before { library }

    context '#create' do
      it 'create with success information' do
        expect(library).to eq Library.first
      end
    end

    context '#read' do
      context 'when read simple' do
        it 'retorn information with success' do
          expect(Library.first.name).to eq 'Biblioteca Dandara'
        end
      end

      context 'when read by location origin' do
        let(:libraries_praia_grande) do
          FactoryBot.create(:library, name: 'test praia grande',
                                      latitude: -24.040680,
                                      longitude: -46.513160)
        end
        let(:libraries_jurema) do
          FactoryBot.create(:library, name: 'test jurema',
                                      latitude: -23.430300,
                                      longitude: -46.517750)
        end
        let(:libraries_centro_guarulhos) do
          FactoryBot.create(:library, name: 'test guarulhos',
                                      latitude: -23.454338,
                                      longitude: -46.533669)
        end
        let(:lat_avenida_jurema) { -23.4508001 }
        let(:lng_avenida_jurema) { -46.4076736 }

        it 'retorn location more near from origin' do
          libraries_praia_grande
          libraries_jurema
          libraries_centro_guarulhos

          expect(Library.by_distance(origin: [lat_avenida_jurema,
                                              lng_avenida_jurema]).first[:name]).to eq 'test jurema'
        end
      end
    end

    context '#update' do
      it 'update information with success' do
        update_library
        expect(Library.first.name).to eq 'Biblioteca Zumbi dos Palmares'
      end
    end

    context '#delete' do
      let(:delete_library) do
        Library.first.delete
      end

      it 'delete information with success' do
        delete_library
        expect(Library.first).to eq nil
      end
    end
  end
end
