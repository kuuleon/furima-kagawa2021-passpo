require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end
  describe '商品購入' do
    context '購入できるとき' do
      it 'すべてのフォームの入力がされている' do
        expect(@purchase_address).to be_valid
      end
      it "建物名が空の場合でも保存できること" do
        @purchase_address.building_name = ''
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'postal_code が空では登録できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '123ー4567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では保存できないこと' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture id can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'tel_numberが空では保存できないこと' do
        @purchase_address.tel_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが英数混合では保存できないこと' do
        @purchase_address.tel_number = '００００００００aaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number is not a number")
      end
      it 'tel_numberが10桁以上11桁以内の数値のみでなければ保存できないこと' do
        @purchase_address.tel_number = '０００００００００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel number is not a number")
      end
      it "user_idが空では登録できないこと" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end


# 配送先の住所情報も購入の都度入力させること。
# 郵便番号が必須であること。
# 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
# 都道府県が必須であること。
# 市区町村が必須であること。
# 番地が必須であること。
# 建物名は任意であること。
# 電話番号が必須であること。
# 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。