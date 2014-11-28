require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should_get_new" do
    get :new
    assert_response :success
  end

  test "should_create_user" do
    assert_difference('User.count') do
      post :create, user: { name: 'Mark Twain', password: 'secret123', 
        password_confirmation: 'secret123' }
    end
    assert_redirected_to users_path
  end

  test "should_show_user" do
    get :show, id: @user
    assert_response :success
  end

  test "should_get_edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should_update_user" do
    patch :update, id: @user, user: { name: @user.name, password: 'secret',
      password_confirmation: 'secret' }
    assert_redirected_to users_path
  end

  test "should_destroy_user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
  end
end
