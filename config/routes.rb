# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resource :library, only: %i[create]
  end
end
