class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  #PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order"]
  belongs_to :pay_type
  #validates_presence_of :pay_type_id

  validates :name, :address, :email, presence: true
  #validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
end
