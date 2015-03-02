require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
