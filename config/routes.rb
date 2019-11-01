Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  root 'posts#index'

  # instead of doing this - using scoping
  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  # set the url prefix, '/admin', and tell rails that all of the included routes will be handled by the admin module - place views in 'views/admin/stats/'
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  # replace above with namespace method - assumes that path prefix and module name match
  namespace :admin do
    resources :stats, only: [:index]
  end
end
