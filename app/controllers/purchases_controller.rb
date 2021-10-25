class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @address.valid?
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:donation_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :tel_number).merge(user_id: current_user.id, item_id: item_id)
  end

  # def address_params
  #   params.require(:address).permit(:postal_code, :prefecture_id, :city,:house_number, 
  #                                   :building_number, :tel_number).merge(:purchase_id: @purchase.id)
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end
end
