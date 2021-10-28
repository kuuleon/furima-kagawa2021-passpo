class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_number, :tel_number, :user_id, :item_id

  # 必須
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :tel_number, numericality: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number'}
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  validates :tel_number, length: { minimum: 10, message: 'is too short' }
  validates :tel_number, length: { maximum: 11, message: 'is too long' }


  # 必須、ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_number: building_number, tel_number: tel_number, purchase_id: purchase.id)
  end
end
