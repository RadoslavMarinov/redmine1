class ProductsController < ApplicationController
  before_action :find_project, :authorize, only: [:index, :create, :destroy, :new, :edit, :update]
  before_action :find_product, only: [:show, :edit,:destroy, :update]

  def index
    if params.has_key?(:name)
      puts ">>>>\n\nYes there is a name in the parameters #{params[:name]}\n\n"
      @products = Product.title_includes(params[:name])
    else
      @products = Product.all
    end 
    if params.has_key?(:sort_title)
      puts ">>>>\n\nYes there is a SORT in the parameters #{params[:sort_title]}\n\n"
      @products = @products.order(:title => params[:sort_title])
    end
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
    @product.update(product_params)
    flash[:notice] = l(:notice_successful_update)
    redirect_to products_path(:project_id => @project)
  end

  def create

    product = Product.create(product_params)
    flash[:notice] = l(:notice_successful_create)
    redirect_to products_path(:project_id =>  @project)
  end

  def destroy
    @product.destroy
    flash[:notice] = l(:notice_successful_delete)
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
