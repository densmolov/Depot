class AddPayTypeToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :pay_type, index: true
  end
end
