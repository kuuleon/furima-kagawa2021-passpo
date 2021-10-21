FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { Faker::Internet.free_email }
    password              { '00000a' }
    password_confirmation { '00000a' }
    family_name           { 'ぜんかく' }
    first_name            { 'ぜんかく' }
    family_name_kana      { 'ゼンカクカナ' }
    first_name_kana       { 'ゼンカクカナ' }
    birthday              { '2020-01-01' }
  end
end
