class CommentsController < ApplicationController
  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    comment = Comment.create(comment_params)
    @comment = comment
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment, user: @comment.user.nickname
    end
    #redirect_to item_path(comment.item_id)

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
