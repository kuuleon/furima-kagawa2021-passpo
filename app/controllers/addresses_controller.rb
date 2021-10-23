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
end
