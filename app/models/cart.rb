class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
      current_item.price = current_item.product.price
    end
    return current_item
  end

  # def remove_product(line_item_id)
  #   current_item = line_items.find_by(id: line_item_id)
  #   current_item.quantity -= 1
  #   current_item.save!
  #   return current_item
  # end

  def remove_product(line_item_id)
    current_item = line_items.find_by(id: line_item_id)
    if current_item.quantity == 1
      current_item.destroy
    else
      current_item.quantity -= 1
      current_item.save!
    end
    return current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

end
