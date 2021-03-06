class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    #binding.pry
    #@item = Item.new
    @item = ItemTag.new
  end

  def create
    #@item = Item.new(item_params)
 
    @item = ItemTag.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @comments = @comments.order('created_at ASC')
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end

  private

  def item_params
    params.require(:item_tag).permit(:name, :text, :status_id, :burden_id, :address_origin_id, :delivery_time_id, :genre_id, :price, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
