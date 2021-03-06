Rails.application.routes.draw do
  api_version(module: "V1", header: { name: "Accept", value: "application/vnd.perish.com; version=1"}, parameter: { name: "version", value: "1"}, path: { value: "v1" }, defaults: { format: :json }, default: true) do
    resources :perishables, only: [:show, :create, :destroy] do
      resource :download, only: [:create]
    end
  end

  match '/404', to: 'errors#not_found', via: :all, defaults: { format: :json }
  match '/422', to: 'errors#unprocessable_entity', via: :all, defaults: { format: :json }
  match '/500', to: 'errors#internal_server_error', via: :all, defaults: { format: :json }
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
