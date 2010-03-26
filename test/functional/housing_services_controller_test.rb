require 'test_helper'

class HousingServicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housing_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing_service" do
    assert_difference('HousingService.count') do
      post :create, :housing_service => { }
    end

    assert_redirected_to housing_service_path(assigns(:housing_service))
  end

  test "should show housing_service" do
    get :show, :id => housing_services(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => housing_services(:one).to_param
    assert_response :success
  end

  test "should update housing_service" do
    put :update, :id => housing_services(:one).to_param, :housing_service => { }
    assert_redirected_to housing_service_path(assigns(:housing_service))
  end

  test "should destroy housing_service" do
    assert_difference('HousingService.count', -1) do
      delete :destroy, :id => housing_services(:one).to_param
    end

    assert_redirected_to housing_services_path
  end
end
