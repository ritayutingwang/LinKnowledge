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
  end

  test "should redirect to user_omniauth_authorize_path if user not signed in while backing" do
    post :create, project_id: @project.id, backing: { 
      amount: 10, 
      reward: 'Standard'
    }
    assert_redirected_to user_omniauth_authorize_path(:facebook)
  end

  test "should get show" do
    @backing = backings(:one)
    get :show, project_id: @project.id, id: @backing.id
    assert_response :success
  end

end
