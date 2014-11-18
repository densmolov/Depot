require 'test_helper'

class CartTest < ActiveSupport::TestCase

	test "should create new cart with 3 different products" do
	  cart = Cart.create
	  book_1 = products(:one)
	  book_2  = products(:two)
	  book_3 = products(:ruby)
	  cart.add_product(book_1.id).save!
	  cart.add_product(book_2.id).save!
	  cart.add_product(book_3.id).save!
	  assert_equal 3, cart.line_items.size
	  assert_equal book_1.price + book_2.price + book_3.price, cart.total_price
	end
	
	test "should add duplicate products" do
	  cart = Cart.create
	  book = products(:ruby)
	  cart.add_product(book.id).save!
	  cart.add_product(book.id).save!
	  assert_equal 2*book.price, cart.total_price
	  assert_equal 1, cart.line_items.size
	  assert_equal 2, cart.line_items[0].quantity
	end

end
