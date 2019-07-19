# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see:
  # https://guides.rubyonrails.org/routing.html

  root 'shortcut_urls#new'

  get '/404', to: 'errors#not_found'

  post 'create-url', to: 'shortcut_urls#create', as: :create_shortcut
  get '/:token', to: 'shortcut_urls#show', as: :show_shortcut
end
