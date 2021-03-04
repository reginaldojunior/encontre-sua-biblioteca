# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'CRUD' do
    let(:library) do
      Library.create(
        name: 'Biblioteca Dandara',
        description: 'Biblioteca Dandara, uma biblioteca comunitária',
        image_src: 'https://url.com.br/image.jpg',
        latitude: -23.090809890,
        longitude: -32.123190899,
        disponible: 0
      )
    end
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
      it 'retorn information with success' do
        expect(Library.first.name).to eq 'Biblioteca Dandara'
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
