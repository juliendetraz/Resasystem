require 'test_helper'

class MessageUsergroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_usergroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_usergroup" do
    assert_difference('MessageUsergroup.count') do
      post :create, :message_usergroup => { }
    end

    assert_redirected_to message_usergroup_path(assigns(:message_usergroup))
  end

  test "should show message_usergroup" do
    get :show, :id => message_usergroups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => message_usergroups(:one).to_param
    assert_response :success
  end

  test "should update message_usergroup" do
    put :update, :id => message_usergroups(:one).to_param, :message_usergroup => { }
    assert_redirected_to message_usergroup_path(assigns(:message_usergroup))
  end

  test "should destroy message_usergroup" do
    assert_difference('MessageUsergroup.count', -1) do
      delete :destroy, :id => message_usergroups(:one).to_param
    end

    assert_redirected_to message_usergroups_path
  end
end
