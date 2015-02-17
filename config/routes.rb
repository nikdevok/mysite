Rails.application.routes.draw do

  resources :method_files

  resources :achievements

  resources :static_pages



  resources :comments

  resources :static_pages



  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :admin do
    resources :users
  end

  resources :feedbacks

  resources :comments do
    resources :answers
  end

  resources :albums
  resources :images do
    post :images_destroy, :on => :collection
  end

  resources :albums do
      post :clear

      resources :images
  end


  #mount Ckeditor::Engine => "/ckeditor"

  resource :contact, controller: :contact

  get 'about_me' => "static_pages#about_me"
  get 'shedule_page' => "static_pages#shedule_page"
  post 'upload_image' => "uploader#upload"
  post 'delete_image' => "uploader#delete"

  resources :news
  resources :consultations
  resources :about_me
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catsalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root 'static_pages#main_page'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
