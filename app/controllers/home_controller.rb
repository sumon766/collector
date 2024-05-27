class HomeController < ApplicationController
  def index
    @tags = Tag.all
    @items = Item.order(created_at: :desc).limit(10)
    @collections = Collection.left_joins(:items)
                             .group(:id)
                             .order('COUNT(items.id) DESC')
                             .limit(5)
  end
end
