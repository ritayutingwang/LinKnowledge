require 'test_helper'

class CuriositiesControllerTest < ActionController::TestCase
  setup do
    @curiosity = curiosities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curiosities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curiosity" do
    assert_difference('Curiosity.count') do
      post :create, curiosity: { description: @curiosity.description, title: @curiosity.title, user_id: @curiosity.user_id }
    end

    assert_redirected_to curiosity_path(assigns(:curiosity))
  end

  test "should show curiosity" do
    get :show, id: @curiosity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curiosity
    assert_response :success
  end

  test "should update curiosity" do
    patch :update, id: @curiosity, curiosity: { description: @curiosity.description, title: @curiosity.title, user_id: @curiosity.user_id }
    assert_redirected_to curiosity_path(assigns(:curiosity))
  end

  test "should destroy curiosity" do
    assert_difference('Curiosity.count', -1) do
      delete :destroy, id: @curiosity
    end

    assert_redirected_to curiosities_path
  end
end
