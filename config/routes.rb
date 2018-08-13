Rails.application.routes.draw do
  get 'try/api'
  get 'home/show'
  devise_for :users
  get 'home/index'
  root 'home#index'

  namespace 'api' do
    namespace 'v1' do
      resources :markers
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
