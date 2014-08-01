require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert 3 >= assigns(:projects).size
  end

  test "get new when user not signed in" do
    get :new
    assert_response :success
    assert_not_nil assigns(:project)
  end

  test "get new with params when user not signed in" do
    get :new, project: {
      name: :test,
      description: :description,
    }
    assert_response 302
  end

  test "get new with params when user signed in" do
    user = users(:one)
    sign_in user
    get :new, project: {
      name: :test,
      description: :description,
    }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should create project when user signed in" do
    user = users(:one)
    sign_in user
    assert_difference('Project.count') do
      post :create, project: { 
        name: 'test project', 
        description: 'test', 
        target_price: 10000 
      }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "create should fail when user not signed in" do
    post :create
    assert_response 302
  end

  test "should get show" do
    @project = projects(:one)
    get :show, id: @project.id
    assert_response :success
  end

end
