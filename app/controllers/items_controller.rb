class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save  # 出品情報の保存に成功した場合、
      redirect_to root_path # ルートパスに戻る
    else
      render :new # データが保存されなかったときは新規投稿ページへ戻る(newアクションのnew.html.erbを表示する)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :statement_id, :load_id, :prefecture_id, :delivery_days_id,
                                 :item_price, :image).merge(user_id: current_user.id)
  end
end
