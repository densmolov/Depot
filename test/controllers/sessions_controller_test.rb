require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should_get_new" do
    get :new
    assert_response :success
  end

  test "should_login" do
    dave = users(:one)
    post :create, name: dave.name, password: 'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end

  test "should_fail_login" do
    dave = users(:one)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should_logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
