class Address < ApplicationRecord
  belongs_to :purchase

  validates :postal_code      , presence: true
  validates :prefecture_id    , presence: true
  validates :city             , presence: true
  validates :house_number     , presence: true
  validates :building_number  , presence: true
  validates :tel_number       , presence: true
  validates :purchase         , presence: true
end
