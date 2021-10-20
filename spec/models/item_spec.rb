require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')

  end

  describe '出品機能' do
    context '出品ができる時' do
      it "必須項目が全てあれば登録できること" do
        expect(@item).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end


    context '出品ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
        @item.statement_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Statement can't be blank", "Statement can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.load_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank", "Load can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank", "Delivery days can't be blank")
      end

      it '販売価格についての情報が必須であること' do
        @item.item_price= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number", "Item price Out of setting range")
      end

      it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.item_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @item_price = '１００００'
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end