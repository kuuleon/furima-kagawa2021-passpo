FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    #image { Faker::Lorem.sentence }
    explain { Faker::Lorem.sentence }
    association :user
    category_id           { 2 }
    statement_id          { 2 }
    load_id               { 2 }
    prefecture_id         { 2 }
    delivery_days_id      { 2 }
    item_price            { 5000 }

    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
