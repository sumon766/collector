class ItemsController < ApplicationController
  before_action :set_collection
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /collections/:collection_id/items
  def index
    @collection = Collection.find(params[:collection_id])
    @items = @collection.items
  end

  # GET /collections/:collection_id/items/1
  def show
  end

  # GET /collections/:collection_id/items/new
  def new
    @item = @collection.items.build
  end

  # GET /collections/:collection_id/items/1/edit
  def edit
  end

  # POST /collections/:collection_id/items
  def create
    @item = @collection.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to [@collection, @item], notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: [@collection, @item] }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/:collection_id/items/1
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to [@collection, @item], notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: [@collection, @item] }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/:collection_id/items/1
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to collection_items_url(@collection), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_item
    @item = @collection.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :tags, :custom_string1_value, :custom_string2_value, :custom_string3_value, :custom_int1_value, :custom_int2_value, :custom_int3_value, :custom_txt1_value, :custom_txt2_value, :custom_txt3_value, :custom_date1_value, :custom_date2_value, :custom_date3_value)
  end
end
