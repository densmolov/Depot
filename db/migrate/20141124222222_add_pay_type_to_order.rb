class AddPayTypeToOrder < ActiveRecord::Migration

  def change
    add_reference :orders, :pay_type, index: true
    remove_column :orders, :pay_type
  end

end
