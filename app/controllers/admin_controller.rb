class AdminController < ApplicationController

  def index
    @total_orders = Order.count
    if @total_orders == 0
      @total_orders = 'no'
    end
  end

end
