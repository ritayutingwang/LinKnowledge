require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert 3 >= assigns(:projects).size
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { 
        name: 'test project', 
        description: 'test', 
        target_price: 10000 
      }
    end

    assert (assigns(:project).due_day - assigns(:project).init_day).to_i == 15
    assert_redirected_to project_path(assigns(:project))
  end

  test "should get show" do
    @project = projects(:one)
    get :show, id: @project.id
    assert_response :success
  end

end
