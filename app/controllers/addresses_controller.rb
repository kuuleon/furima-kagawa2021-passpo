class AddressesController < ApplicationController

  def index
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city,:house_number, 
                                    :building_number, :tel_number)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end
end
