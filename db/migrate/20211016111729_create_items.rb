class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name,          null: false
      t.text        :explain,            null: false
      t.integer     :item_price,         null: false
      t.references  :user,               null: false, foreign_key: true

      t.integer     :category_id,        null: false
      t.integer     :statement_id,       null: false
      t.integer     :load_id,            null: false
      t.integer     :prefecture_id,      null: false
      t.integer     :delivery_days_id,   null: false

      t.timestamps
    end
  end
end
