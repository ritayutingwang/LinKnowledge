require 'test_helper'

class BackingsControllerTest < ActionController::TestCase

  def setup
    @project = projects(:one)
  end

  test "should get new" do
    get :new, project_id: @project.id
    assert_response :success
    assert_not_nil assigns(:backing)
    assert_not_nil assigns(:project)
  end

  test "should get confirmation page if user is signed in" do
    user = users(:one)
    sign_in user
    get :confirmation, project_id: @project.id, backing: { 
      amount: 10, 
      reward: 'Standard'
    }

    assert_response :success
  end

  test "should redirect if user is not signed in while getting confirmation" do
    get :confirmation, project_id: @project.id, backing: { 
      amount: 10, 
      reward: 'Standard'
    }
    assert_response 302
  end

  test "should create backing" do
    user = users(:one)
    sign_in user
    assert_difference('Backing.count') do
      post :create, project_id: @project.id, backing: { 
        amount: 10, 
        reward: 'Standard'
      }
    end
    assert assigns(:backing).user == user
    assert_redirected_to project_backing_path(@project, assigns(:backing))
  end

  test "create should fail is user is not signed in" do
    post :create, project_id: @project.id, backing: { 
      amount: 10, 
      reward: 'Standard'
    }
    assert_response 302
  end

  test "should get show" do
    @backing = backings(:one)
    get :show, project_id: @project.id, id: @backing.id
    assert_response :success
  end

end
