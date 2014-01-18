Api::Application.routes.draw do
  api_version(:module => "Api::V1", :path => {:value => "api/v1"}) do
  end
  devise_for :users
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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

  api_version(:module => 'Api::V1', :path => {:value => 'api/v1'}, :defaults => {:format => :json}, :default => true) do
    #resources :invites, only: [:create, :show]
    #resources :friends, only: [:index]
    #match '/checkin_credits/summary' => 'checkin_credits#summary', via: :get
    #match '/venues/search' => 'venues#search', via: :get
    #match '/checkins/leaders' => 'checkins#leaders', via: :get
    #match '/checkins/leaders/recent' => 'checkins#leaders', since_date: 1.week.ago.to_formatted_s, via: :get
    #resources :checkins, only: [:show, :create]
    #match '/checkins/nearby/recent' => 'checkins#nearby_recent', via: :get
    #match '/venues/nearby/popular' => 'venues#nearby_popular', via: :get
    #resources :causes, only: [:index]
    #resource :cause_donation, only: [:create]
    #match '/impacts/user' => 'cause_donations#user_impact', via: :get
    #match '/impacts/total' => 'cause_donations#total_impact', via: :get
  end
end
