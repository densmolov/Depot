class AddPriceToLineItems < ActiveRecord::Migration

	def change
    	add_column :line_items, :price, :decimal, precision: 8, scale: 2, default: 0.00
    	
        LineItem.all.each do |line_item|
            line_item.price = line_item.product.price
            line_item.save!
        end
    end

end
