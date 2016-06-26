require 'test_helper'

class UserRoleInEventsControllerTest < ActionController::TestCase
  setup do
    @user_role_in_event = user_role_in_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_role_in_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_role_in_event" do
    assert_difference('UserRoleInEvent.count') do
      post :create, user_role_in_event: {  }
    end

    assert_redirected_to user_role_in_event_path(assigns(:user_role_in_event))
  end

  test "should show user_role_in_event" do
    get :show, id: @user_role_in_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_role_in_event
    assert_response :success
  end

  test "should update user_role_in_event" do
    patch :update, id: @user_role_in_event, user_role_in_event: {  }
    assert_redirected_to user_role_in_event_path(assigns(:user_role_in_event))
  end

  test "should destroy user_role_in_event" do
    assert_difference('UserRoleInEvent.count', -1) do
      delete :destroy, id: @user_role_in_event
    end

    assert_redirected_to user_role_in_events_path
  end
end
