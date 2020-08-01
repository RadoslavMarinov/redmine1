require File.expand_path('../../test_helper', __FILE__)

class ProductsControllerTest < Redmine::ControllerTest
  
  def test_project_index
    get :index, :params => {
        :project_id=> 'test-project' 
      }
    assert_response :success
  end

  def test_product_creation
    post :create, :params => {
      :project_id=> 'test-project',
      :product => {
        :title =>  'test product',
        :issue_id => 1,
        :release_date => '2020-05-05'
      }
    }
    assert_redirected_to :controller => 'products', :action => 'index', :project_id => 'test-project'
  end

end
