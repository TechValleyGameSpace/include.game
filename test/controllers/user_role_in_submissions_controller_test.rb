require 'test_helper'

class UserRoleInSubmissionsControllerTest < ActionController::TestCase
  setup do
    @user_role_in_submission = user_role_in_submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_role_in_submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_role_in_submission" do
    assert_difference('UserRoleInSubmission.count') do
      post :create, user_role_in_submission: {  }
    end

    assert_redirected_to user_role_in_submission_path(assigns(:user_role_in_submission))
  end

  test "should show user_role_in_submission" do
    get :show, id: @user_role_in_submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_role_in_submission
    assert_response :success
  end

  test "should update user_role_in_submission" do
    patch :update, id: @user_role_in_submission, user_role_in_submission: {  }
    assert_redirected_to user_role_in_submission_path(assigns(:user_role_in_submission))
  end

  test "should destroy user_role_in_submission" do
    assert_difference('UserRoleInSubmission.count', -1) do
      delete :destroy, id: @user_role_in_submission
    end

    assert_redirected_to user_role_in_submissions_path
  end
end
