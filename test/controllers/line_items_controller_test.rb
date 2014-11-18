require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should_get_new" do
    get :new
    assert_response :success
  end

  test "should_create_line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:ruby).id
    end

    assert_redirected_to cart_path(assigns(:line_item).cart)
  end

  test "should_show_line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should_get_edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should_update_line_item" do
    patch :update, id: @line_item, line_item: { product_id: @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should_destroy_line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end
    assert_redirected_to carts_path + '/' + session[:cart_id].to_s
  end
end
