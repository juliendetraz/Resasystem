require 'test_helper'

class BedroomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bedrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bedroom" do
    assert_difference('Bedroom.count') do
      post :create, :bedroom => { }
    end

    assert_redirected_to bedroom_path(assigns(:bedroom))
  end

  test "should show bedroom" do
    get :show, :id => bedrooms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bedrooms(:one).to_param
    assert_response :success
  end

  test "should update bedroom" do
    put :update, :id => bedrooms(:one).to_param, :bedroom => { }
    assert_redirected_to bedroom_path(assigns(:bedroom))
  end

  test "should destroy bedroom" do
    assert_difference('Bedroom.count', -1) do
      delete :destroy, :id => bedrooms(:one).to_param
    end

    assert_redirected_to bedrooms_path
  end
end
