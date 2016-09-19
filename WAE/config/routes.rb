Rails.application.routes.draw do

  namespace :ps_three do
    get 'planning/docs'
  end

  namespace :ps_three do
    get 'planning/akhil'
  end

  namespace :ps_three do
    get 'planning/sainath'
  end

  namespace :ps_three do
    get 'planning/rajesh'
  end

  namespace :ps_two do
    get 'quotations/kill', to: 'quotations#kill'
    get 'quotations/reset', to: 'quotations#reset'
    get 'quotations/export', to: 'quotations#export'
    post 'quotations/import', to: 'quotations#import'
    resources :quotations
  end
  namespace :ps_one do
    get 'zero_division/index'
    get 'youtube/fetch'
  end

  root 'home#index'

  get 'ps_one' => 'ps_one#index'
  get 'ps_two' => 'ps_two#index'
  get 'ps_two/database', to: 'ps_two#database'

  get 'ps_three' => 'ps_three#index'

  #get 'home/index'
  #get 'login' => 'sessions#new', as: 'log_in'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
