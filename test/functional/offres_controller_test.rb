require 'test_helper'

class OffresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offre" do
    assert_difference('Offre.count') do
      post :create, :offre => { }
    end

    assert_redirected_to offre_path(assigns(:offre))
  end

  test "should show offre" do
    get :show, :id => offres(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => offres(:one).to_param
    assert_response :success
  end

  test "should update offre" do
    put :update, :id => offres(:one).to_param, :offre => { }
    assert_redirected_to offre_path(assigns(:offre))
  end

  test "should destroy offre" do
    assert_difference('Offre.count', -1) do
      delete :destroy, :id => offres(:one).to_param
    end

    assert_redirected_to offres_path
  end
end
