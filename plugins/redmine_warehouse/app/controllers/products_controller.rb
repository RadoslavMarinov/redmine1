class ProductsController < ApplicationController
  before_action :find_project, :authorize, only: [:index, :create, :destroy, :new, :edit, :update]
  before_action :find_product, only: [:show, :edit,:destroy, :update]

  def index
    if params.has_key?(:name)
      @products = Product.title_includes(params[:name])
    else
      @products = Product.all
    end 
    if params.has_key?(:sort_title)
      @products = @products.order(:title => params[:sort_title])
    end
  end

  def show
  end

  def edit

  end

  def new
    @product = Product.new
  end

  def update
    success = @product.update(product_params)
    if success
      flash[:notice] = l(:notice_successful_update)
      redirect_to products_path(:project_id => @project)
    else
      flash[:error] = @product.errors.full_messages[0]
      redirect_to new_product_path(:project_id =>  @project)
    end
  end

  def create
    @product = Product.new(product_params)
    if(@product.valid?)
      @product.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to products_path(:project_id =>  @project)
    else
      flash[:error] = @product.errors.full_messages[0]
      redirect_to new_product_path(:project_id =>  @project)
    end
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
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :amount, :release_date)
  end
end
