Rails.application.routes.draw do
  root 'home#index'

  get 'ps_one/index'

  #get 'home/index'

  get 'youtube/fetch'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
