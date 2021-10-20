class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_days_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :load_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :statement_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :item_price, numericality: { in: 300..9999999}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :load
  belongs_to :delivery_days
  belongs_to :prefecture
  belongs_to :statement

end




#まだ
# カテゴリーは、「---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目が表示されること（--- は初期値として設定すること）。
# 商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目が表示されること（--- は初期値として設定すること）。
# 配送料の負担は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目が表示されること（--- は初期値として設定すること）。
# 発送元の地域は、「---」と47都道府県の合計48項目が表示されること（--- は初期値として設定すること）。
# 発送までの日数は、「---、12日で発送、23日で発送、4~7日で発送」の4項目が表示されること（--- は初期値として設定すること）。


# #やった
# 価格の情報が必須であること。
# 価格は、¥300~¥9,999,999の間のみ保存可能であること。
# 価格は半角数値のみ保存可能であること。
# 商品名が必須であること。
# 商品の説明が必須であること。
# 商品画像を1枚つけることが必須であること。
# カテゴリーの情報が必須であること。
# 商品の状態の情報が必須であること。
# 配送料の負担の情報が必須であること。
# 発送元の地域の情報が必須であること。
# 発送までの日数の情報が必須であること。
