class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    set_item
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    redirect_to root_path if @item.purchase.present?
    @purchase_address = PurchaseAddress.new
  end

  def create
    set_item
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :tel_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # def address_params
  #   params.require(:address).permit(:postal_code, :prefecture_id, :city,:house_number,
  #                                   :building_number, :tel_number).merge(purchase_id: purchase_id)
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[@item.item_price],  # 商品の値段
      card: purchase_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
