require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  setup do
    @order = orders(:one)
  end

  test "requires_item_in_cart" do
    get :new
    assert_redirected_to store_path
    assert_equal flash[:notice], "Your cart is empty!"
  end

  test "should_get_index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should_get_new" do
    cart = Cart.create
    session[:cart_id] = cart.id
    li = LineItem.create(product: products(:ruby))
    li.cart = cart
    li.save!
    get :new
    assert_response :success
  end

  test "should_create_order" do
    assert_difference('Order.count') do
      post :create, order: { address: @order.address, email: @order.email,
        name: @order.name, pay_type: @order.pay_type }
    end
    assert_redirected_to store_path
  end

  test "should_show_order" do
    get :show, id: @order
    assert_response :success
  end

  test "should_get_edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should_update_order" do
    patch :update, id: @order, order: { address: @order.address,
      email: @order.email, name: @order.name, pay_type: @order.pay_type }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should_destroy_order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end
    assert_redirected_to orders_path
  end
end
