# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# get 'products', to: 'products#index'
resources :products
post '/products/new' , :to => 'products#create', :as => 'create_product'