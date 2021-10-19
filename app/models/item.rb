class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  validates :item_price, , numericality: { in: 300..9999999}
end
