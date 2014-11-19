class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart 

  def index
    @products = Product.order(:title)
    @intermediate_counter = "It is your visit number #{count_before_adding_to_cart}."
    @ultimate_counter = "It is your visit number #{count_always}."
  end

    # This counter becomes equal to 0 when smth is added to the Cart.
  private
  def count_before_adding_to_cart
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
  end

    # This counter2 stores all 'index page' calls.
  private
  def count_always
    if session[:counter2].nil?
      session[:counter2] = 1
    else
      session[:counter2] += 1
    end
  end

end
