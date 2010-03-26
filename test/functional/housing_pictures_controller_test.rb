require 'test_helper'

class HousingPicturesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housing_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing_picture" do
    assert_difference('HousingPicture.count') do
      post :create, :housing_picture => { }
    end

    assert_redirected_to housing_picture_path(assigns(:housing_picture))
  end

  test "should show housing_picture" do
    get :show, :id => housing_pictures(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => housing_pictures(:one).to_param
    assert_response :success
  end

  test "should update housing_picture" do
    put :update, :id => housing_pictures(:one).to_param, :housing_picture => { }
    assert_redirected_to housing_picture_path(assigns(:housing_picture))
  end

  test "should destroy housing_picture" do
    assert_difference('HousingPicture.count', -1) do
      delete :destroy, :id => housing_pictures(:one).to_param
    end

    assert_redirected_to housing_pictures_path
  end
end
