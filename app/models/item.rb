class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :load
  belongs_to :delivery_days
  belongs_to :prefecture
  belongs_to :statement

  # 必須
  with_options presence: true do
    validates :image, :item_name, :explain, :item_price
  end

  # 必須、ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :delivery_days_id
    validates :load_id
    validates :prefecture_id
    validates :statement_id
  end

  # 価格は、¥300~¥9,999,999の間のみ且つ半角数値のみ保存可能
  validates :item_price, numericality: { only_integer: true }
  validates :item_price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :item_price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
