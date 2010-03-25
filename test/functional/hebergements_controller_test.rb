require 'test_helper'

class HebergementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hebergements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hebergement" do
    assert_difference('Hebergement.count') do
      post :create, :hebergement => { }
    end

    assert_redirected_to hebergement_path(assigns(:hebergement))
  end

  test "should show hebergement" do
    get :show, :id => hebergements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hebergements(:one).to_param
    assert_response :success
  end

  test "should update hebergement" do
    put :update, :id => hebergements(:one).to_param, :hebergement => { }
    assert_redirected_to hebergement_path(assigns(:hebergement))
  end

  test "should destroy hebergement" do
    assert_difference('Hebergement.count', -1) do
      delete :destroy, :id => hebergements(:one).to_param
    end

    assert_redirected_to hebergements_path
  end
end
