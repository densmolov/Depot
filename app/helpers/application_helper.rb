module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def get_total_orders
    @total_orders = Order.count
    if @total_orders == 0
      @total_orders = 'no'
    end
    return @total_orders
  end

end