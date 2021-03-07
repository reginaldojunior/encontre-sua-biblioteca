# frozen_string_literal: true

FactoryBot.define do
  factory :library do
    name { 'Biblioteca Dandara' }
    description { 'Biblioteca Dandara, biblioteca comunitaria' }
    latitude { -23.90832 }
    longitude { -22.90832 }
    image_src { 'https://url.com.br/image.jpg' }
    disponible { 0 }
  end
end
