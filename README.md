#  DB 設計

## users table

| Column                | Type           | Options                    |
|-----------------------|----------------|----------------------------|
| nickname              | string         | null: false                |
| email                 | string         | null: false, unique: true  |
| encrypted_password    | string         | null: false                |
| first_name            | string         | null: false                |
| family_name           | string         | null: false                |
| first_name_kana       | string         | null: false                |
| family_name_kana      | string         | null: false                |
| birthday              | date           | null: false                |

### Association

has_many :items
has_many :purchases


## items table

| Column                | Type           | Options                        |
|-----------------------|----------------|--------------------------------|
| item_name             | string         | null: false                    |
| explain               | text           | null: false                    |
| item_price            | integer        | null: false                    |
| user                  | references     | null: false, foreign_key: true |
| category_id           | integer        | null: false                    |
| statement_id          | integer        | null: false                    |
| load_id               | integer        | null: false                    |
| area_id               | integer        | null: false                    |
| delivery_days_id      | integer        | null: false                    |

### Association

belongs_to :user
has_one :purchase


## purchases table

| Column                | Type           | Options                        |
|-----------------------|----------------|--------------------------------|
| user                  | references     | null: false, foreign_key: true |
| item                  | references     | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address


## addresses table

| Column                | Type           | Options                        |
|-----------------------|----------------|--------------------------------|
| postal_code           | string         | null: false                    |
| prefecture_id         | integer        | null: false                    |
| city                  | string         | null: false                    |
| house_number          | string         | null: false                    |
| building_number       | string         |                                |
| tel_number            | string         | null: false                    |
| purchase              | references     | null: false, foreign_key: true |

### Association

belongs_to :purchase