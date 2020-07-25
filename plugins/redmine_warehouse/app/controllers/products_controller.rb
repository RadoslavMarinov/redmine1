class ProductsController < ApplicationController
  before_action :find_project, :authorize, only: [:index]

  def index
    puts "\n\n>>>>>>>>>>>>>"
    puts params
    puts @project.inspect
    puts "<<<<<<<<<<<<<\n\n"
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    puts "\n\n CREATE \n\n"
    puts "\n\n params: #{params} \n\n"
    puts "\n\n product_params: #{product_params} \n\n"
    product = Product.create(product_params)
    redirect_to products_path
  end


  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :amount, :release_date)
  end
end
