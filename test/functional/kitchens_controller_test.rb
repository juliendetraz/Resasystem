require 'test_helper'

class KitchensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kitchens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kitchen" do
    assert_difference('Kitchen.count') do
      post :create, :kitchen => { }
    end

    assert_redirected_to kitchen_path(assigns(:kitchen))
  end

  test "should show kitchen" do
    get :show, :id => kitchens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => kitchens(:one).to_param
    assert_response :success
  end

  test "should update kitchen" do
    put :update, :id => kitchens(:one).to_param, :kitchen => { }
    assert_redirected_to kitchen_path(assigns(:kitchen))
  end

  test "should destroy kitchen" do
    assert_difference('Kitchen.count', -1) do
      delete :destroy, :id => kitchens(:one).to_param
    end

    assert_redirected_to kitchens_path
  end
end
