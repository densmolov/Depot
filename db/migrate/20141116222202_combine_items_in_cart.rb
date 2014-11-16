class CombineItemsInCart < ActiveRecord::Migration

	def up
	    # замена нескольких записей для одного и того же товара в корзине одной записью
        Cart.all.each do |cart|
	        # подсчет количества каждого товара в корзине
	        sums = cart.line_items.group(:product_id).sum(:quantity)
	        sums.each do |product_id, quantity|
	        if quantity > 1
                # удаление отдельных записей
                cart.line_items.where(product_id: product_id).delete_all
                # замена одной записью
                item = cart.line_items.build(product_id: product_id)
                item.quantity = quantity
                item.save!
                end
            end
        end
    end

end
