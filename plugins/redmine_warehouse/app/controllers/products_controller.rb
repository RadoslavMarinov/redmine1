class ProductsController < ApplicationController
  before_action :find_project, :authorize, only: :index

  def index
    puts "\n\n>>>>>>>>>>>>>"
    puts params
    puts @project.inspect
    puts "<<<<<<<<<<<<<\n\n"
    @products = Product.all
  end


  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
