APGM2::Application.routes.draw do

  devise_for :users

  resources :posts      #Jach: This insures that the application answers to the RESTful URI, basically it will respond to a create action
  #resources :sessions, only: [:new, :create, :destroy]    #we don't nees the edit and show actions
  resources :users
  resources :events

  root 'posts#home'

  match '/new_post', to: 'posts#new', via: 'get'

  
  match '/contact', to: 'posts#contact', via: 'get'
 
  match '/edit_post', to: 'posts#edit', via: 'get'

  #match '/newuser', to: 'users#new_user', via: 'get'

  match '/newevent', to: 'events#new', via: 'get'
  
  match '/edit_event', to: 'events#edit', via: 'get'
  
  #match '/signin', to: 'sessions#new', via: 'get'
  
  #match '/signout', to: 'sessions#destroy', via: :delete  #via: :delete for the signout route, which indicated that it should be invoked using an HTTP DELETE request.

  match '/userlist', to: 'users#user_list', via: 'get'

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end

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
