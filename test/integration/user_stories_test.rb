require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

	test "integr_test" do
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby)

  # A client visits our site
    get "/"
    assert_response :success
    assert_template "index"

  # He chooses a book, adds it to his cart
    xml_http_request :post, '/line_items', product_id: ruby_book.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal ruby_book, cart.line_items[0].product

  # The client makes an order
    get "/orders/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/orders",
      order: { name:        "Dave Thomas",
               address:     "123 The Street",
               email:       "dave@example.com",
               pay_type_id: 2 }
    assert_response :success
    assert_template "index"
    assert_raises(ActiveRecord::RecordNotFound) do
      cart = Cart.find(session[:cart_id])
    end

  # Check the database with the new order

    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal "Dave Thomas", order.name
    assert_equal "123 The Street", order.address
    assert_equal "dave@example.com", order.email
    assert_equal "Credit card", order.pay_type.name

    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product

  # Test the email
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"], mail.to
    assert_equal 'First Second <agilerails2014@gmail.com>', mail[:from].value
    assert_equal "Pragmatic Store Order Confirmation", mail.subject 
  end

end
