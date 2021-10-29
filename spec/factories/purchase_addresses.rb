FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { '3' }
    city { '2' }
    house_number { '1-2' }
    tel_number { '09012345678' }
    building_number {'森ビル'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
