SoftwareManager::Application.routes.draw do
  post "auth/:provider/callback" => "auth#create"
  get "unauthorized" => "auth#unauthorized", as: :unauthorized
  match 'logout' => 'application#logout', via: [:get, :post]

  resources :licenses, only: [:index] do
    resources :allocations

    collection do
      get 'owned' => 'licenses#user_license', as: :owned
    end
  end

  resources :operating_systems

  scope ':os' do
    get 'softwares' => 'softwares#index', as: :os_software
  end

  resources :softwares do
    member do
      get 'download'
    end
    resources :licenses do
      collection do
        get 'owned' => 'licenses#user_license'
      end
    end

    resources :requests, except: [:index] do
      member do
        post 'approve'
      end
    end
  end

  resources :requests, only: [:index]
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#home'

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
