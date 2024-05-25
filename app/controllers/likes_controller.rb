class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    @like = @item.likes.build(user: current_user)
    if @like.save
      respond_to do |format|
        format.html { redirect_to collection_item_path(@item.collection, @item) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to collection_item_path(@item.collection, @item), alert: 'Already liked this item.' }
        format.js
      end
    end
  end

  def destroy
    @like = @item.likes.find_by(user: current_user)
    if @like.destroy
      respond_to do |format|
        format.html { redirect_to collection_item_path(@item.collection, @item) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to collection_item_path(@item.collection, @item), alert: 'Cannot unlike.' }
        format.js
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
