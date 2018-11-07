Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # Can use namespace when you want to route with a module AND use
  # that module's name as the URL prefix. Path will be admin_stats_path
  namespace :admin do
    resources :stats, only: %i[index]
  end

  # Scope, module tells rails to use /admin as the URL prefix and that all included routes
  # will be handled by controllers in admin. path will be stats_path
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: %i[index]
  # end

  root 'posts#index'
end
