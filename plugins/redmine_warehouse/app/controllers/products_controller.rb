class ProductsController < ApplicationController
  before_action :find_project, :authorize, only: [:index, :create, :new, :edit, :update]
  before_action :find_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def show
    #@product = Product.find(params[:id])
  end

  def edit

    #@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def update

    puts params
    @product.update(product_params)
    flash[:notice] = l(:notice_successful_update)
    redirect_to products_path(:project_id => @project)
  end

  def create
    # puts "!!!!!!!!!!!!!!!!!!!!"
    # puts params[:product]["project_id"]
    # puts "????????????????????"
    # @project = Project.find(params[:product]["project_id"])
    product = Product.create(product_params)
    flash[:notice] = l(:notice_successful_create)
    redirect_to products_path(:project_id =>  @project)
  end


  private

  def find_product
    @product = Product.find(params[:id])  
  end
  def find_project
    puts "\n\n FIND PROJECT>>>>>>>>>>>>"
    puts params[:project_id]
    puts "<<<<<<<<<<<<\n\n"
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :amount, :release_date)
  end
end
