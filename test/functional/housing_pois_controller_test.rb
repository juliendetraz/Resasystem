require 'test_helper'

class HousingPoisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housing_pois)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing_poi" do
    assert_difference('HousingPoi.count') do
      post :create, :housing_poi => { }
    end

    assert_redirected_to housing_poi_path(assigns(:housing_poi))
  end

  test "should show housing_poi" do
    get :show, :id => housing_pois(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => housing_pois(:one).to_param
    assert_response :success
  end

  test "should update housing_poi" do
    put :update, :id => housing_pois(:one).to_param, :housing_poi => { }
    assert_redirected_to housing_poi_path(assigns(:housing_poi))
  end

  test "should destroy housing_poi" do
    assert_difference('HousingPoi.count', -1) do
      delete :destroy, :id => housing_pois(:one).to_param
    end

    assert_redirected_to housing_pois_path
  end
end
