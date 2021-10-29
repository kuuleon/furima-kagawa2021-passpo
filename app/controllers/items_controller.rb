class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if @item.user_id == current_user.id
    redirect_to root_path
  end

  def edit
    redirect_to root_path if @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :statement_id, :load_id, :prefecture_id, :delivery_days_id,
                                 :item_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user != @item.user
  end
end
