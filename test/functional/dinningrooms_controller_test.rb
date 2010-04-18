require 'test_helper'

class DinningroomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dinningrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dinningroom" do
    assert_difference('Dinningroom.count') do
      post :create, :dinningroom => { }
    end

    assert_redirected_to dinningroom_path(assigns(:dinningroom))
  end

  test "should show dinningroom" do
    get :show, :id => dinningrooms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dinningrooms(:one).to_param
    assert_response :success
  end

  test "should update dinningroom" do
    put :update, :id => dinningrooms(:one).to_param, :dinningroom => { }
    assert_redirected_to dinningroom_path(assigns(:dinningroom))
  end

  test "should destroy dinningroom" do
    assert_difference('Dinningroom.count', -1) do
      delete :destroy, :id => dinningrooms(:one).to_param
    end

    assert_redirected_to dinningrooms_path
  end
end
