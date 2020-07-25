Redmine::Plugin.register :redmine_warehouse do
  name 'Redmine Warehouse plugin'
  author 'Radoslav Marinov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  #permission :products, { products: [:index] }, public: true
  permission :view_products, products: [:index, :show], public: true
  permission :edit_products, products: :edit, public: true
  permission :update_products, products: :update, public: true
  permission :create_products, products: [:new, :create], public: true

  menu :project_menu , :products, { controller: 'products', action: 'index' }, caption: 'Warehouse', param: :project_id
end
