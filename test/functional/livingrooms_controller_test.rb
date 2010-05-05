require 'test_helper'

class LivingroomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:livingrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create livingroom" do
    assert_difference('Livingroom.count') do
      post :create, :livingroom => { }
    end

    assert_redirected_to livingroom_path(assigns(:livingroom))
  end

  test "should show livingroom" do
    get :show, :id => livingrooms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => livingrooms(:one).to_param
    assert_response :success
  end

  test "should update livingroom" do
    put :update, :id => livingrooms(:one).to_param, :livingroom => { }
    assert_redirected_to livingroom_path(assigns(:livingroom))
  end

  test "should destroy livingroom" do
    assert_difference('Livingroom.count', -1) do
      delete :destroy, :id => livingrooms(:one).to_param
    end

    assert_redirected_to livingrooms_path
  end
end
