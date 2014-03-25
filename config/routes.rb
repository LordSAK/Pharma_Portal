PharmaPortal::Application.routes.draw do
  #get "transfer_of_value/edit"
  #match "/transfer_of_value", to: 'transfer_of_value#show',via: 'get'
  #get "transfer_of_value/new"
 # get "transfer_of_value/show"
  #get "spends/new"
  #get "spends/edit"
  #get "spends/index"
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}, via: [:get,:post]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :transfer_of_value
  resources :disputes
  #root to: "static_pages#home"
  root to: "users#new"
  match '/dashboard',to: "static_pages#dashboard", via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'


  match '/recipients', to: 'transfer_of_value#recipients', :via => :post
  match '/spends', to: 'transfer_of_value#spends', :via => :post
  match '/party',to: 'transfer_of_value#party', :via => :post
  match '/product', to: 'transfer_of_value#product', :via => :post
  match '/updates',to: 'transfer_of_value#updates',:via => :post
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
