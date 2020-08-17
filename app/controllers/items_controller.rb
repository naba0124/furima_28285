class ItemsController < ApplicationController
before_action :move_to_index, except: [:index, :show, :new]
before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #binding.pry
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :status_id, :burden_id, :address_origin_id, :delivery_time_id, :genre_id, :price).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
