require 'test_helper'

class AnnoncesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:annonces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create annonce" do
    assert_difference('Annonce.count') do
      post :create, :annonce => { }
    end

    assert_redirected_to annonce_path(assigns(:annonce))
  end

  test "should show annonce" do
    get :show, :id => annonces(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => annonces(:one).to_param
    assert_response :success
  end

  test "should update annonce" do
    put :update, :id => annonces(:one).to_param, :annonce => { }
    assert_redirected_to annonce_path(assigns(:annonce))
  end

  test "should destroy annonce" do
    assert_difference('Annonce.count', -1) do
      delete :destroy, :id => annonces(:one).to_param
    end

    assert_redirected_to annonces_path
  end
end
