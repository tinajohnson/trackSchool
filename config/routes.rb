Rails.application.routes.draw do
  resources :students
  resources :attendances
  resources :class_mappings
  resources :sections
  resources :standards
  resources :schools
  root to: 'admin/dashboard#index'
  get '/sadmin/' => "sadmin#index", as: :sadmin
  get '/teacher' => 'users#teacher', as: :teacher
  get '/mark_attendance'  => 'students#list_students',  as: 'mark_attendance'
  get '/summary' => 'attendances#view_summary', as:'summary'
  get '/summary_show' =>"attendances#summary_show"
  get '/show_selected_id' => 'students#show_selected_id', as: 'show_selected_id'
  get '/sections_choose' => 'sections#section', as:'sections_choose'
  get '/std_sec' => 'attendances#std_sec', as: 'std_sec'
  get '/home' => 'users#teacher' , as: 'teacher_path'
  get '/manage_students' => 'students#index' , as: 'manage_students'
  get '/pick_class' => 'class_mappings#find_mapping_id'
  get '/manage_teacher' =>'users#teacher_crud', as: 'manage_teachers'
  get '/teacher_delete' => 'users#teacher_delete', as: 'teacher_delete'
  get '/teacher_allot_classes' => 'users#teacher_allot_classes' , as: 'teacher_allot_classes'
  get '/class_alloted' => 'users#class_alloted'
  get '/allot_class'  => 'users#batch_action' , as: 'allot_class'
  get '/save' => 'users#save' , as: 'save'
  get '/add_as_teacher' => 'users#add_as_teacher' , as: 'add_as_teacher'

  post '/students/', to: 'students#submit_form'
  devise_for :users
  ActiveAdmin.routes(self)

  # root :to => redirect('/users/sign_in')
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
