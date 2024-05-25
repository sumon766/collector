class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to collection_item_path(@item.collection, @item), notice: "Comment posted successfully"
    else
      redirect_to collection_item_path(@item.collection, @item), alert: "Failed to post comment"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
