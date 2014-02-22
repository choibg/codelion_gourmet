require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get new_session" do
    get :new_session
    assert_response :success
  end

  test "should get create_session" do
    get :create_session
    assert_response :success
  end

  test "should get destroy_session" do
    get :destroy_session
    assert_response :success
  end

end
