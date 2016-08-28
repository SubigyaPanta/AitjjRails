Rails.application.routes.draw do
  namespace :ps_one do
    get 'zero_division/index'
    get 'youtube/fetch'
  end

  root 'home#index'

  get 'ps_one/index'

  #get 'home/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
