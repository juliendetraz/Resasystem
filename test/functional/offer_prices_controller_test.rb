require 'test_helper'

class OfferPricesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offer_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer_price" do
    assert_difference('OfferPrice.count') do
      post :create, :offer_price => { }
    end

    assert_redirected_to offer_price_path(assigns(:offer_price))
  end

  test "should show offer_price" do
    get :show, :id => offer_prices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => offer_prices(:one).to_param
    assert_response :success
  end

  test "should update offer_price" do
    put :update, :id => offer_prices(:one).to_param, :offer_price => { }
    assert_redirected_to offer_price_path(assigns(:offer_price))
  end

  test "should destroy offer_price" do
    assert_difference('OfferPrice.count', -1) do
      delete :destroy, :id => offer_prices(:one).to_param
    end

    assert_redirected_to offer_prices_path
  end
end
