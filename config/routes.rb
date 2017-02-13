Rails.application.routes.draw do

  #shorthand for
  # get '/admin/stats', to: 'stats#index'
  # scope '/admin' do
  #   resources :stats, only: [:index]
  # end

  #scope gives us stats_path
  #moudle: 'admin' is telling this to use controllers in module/folder admin
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  #this instead of stats_path, will generate admin_status_path
  #namespace is shorthand for scope,module
  namespace :admin do
    resources :stats, only: [:index]
  end

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
