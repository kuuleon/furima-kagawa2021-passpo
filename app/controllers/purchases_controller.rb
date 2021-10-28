class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id

    redirect_to root_path if @item.purchase.present?
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :tel_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  # def address_params
  #   params.require(:address).permit(:postal_code, :prefecture_id, :city,:house_number,
  #                                   :building_number, :tel_number).merge(purchase_id: purchase_id)
  # end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  # end
end
