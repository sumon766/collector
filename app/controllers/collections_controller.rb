class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only: %i[ show edit update destroy ]

  def index
    @collections = Collection.all
  end

  def show
  end

  def new
    @collection = Collection.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    set_custom_field_states

    if @collection.save
      redirect_to collection_url(@collection), notice: "Collection was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @collection.update(collection_params)
        set_custom_field_states

        @collection.save
        redirect_to collection_url(@collection), notice: "Collection was successfully updated."
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @collection.destroy!
    redirect_to collections_url, notice: "Collection was successfully destroyed."
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :description, :category, :image_url, :custom_string1_name, :custom_string2_name, :custom_string3_name, :custom_int1_name, :custom_int2_name, :custom_int3_name, :custom_txt1_name, :custom_txt2_name, :custom_txt3_name, :custom_date1_name, :custom_date2_name, :custom_date3_name)
  end

  def set_custom_field_states
    @collection.custom_string1_state = @collection.custom_string1_name.present?
    @collection.custom_string2_state = @collection.custom_string2_name.present?
    @collection.custom_string3_state = @collection.custom_string3_name.present?
    @collection.custom_int1_state = @collection.custom_int1_name.present?
    @collection.custom_int2_state = @collection.custom_int2_name.present?
    @collection.custom_int3_state = @collection.custom_int3_name.present?
    @collection.custom_txt1_state = @collection.custom_txt1_name.present?
    @collection.custom_txt2_state = @collection.custom_txt2_name.present?
    @collection.custom_txt3_state = @collection.custom_txt3_name.present?
    @collection.custom_date1_state = @collection.custom_date1_name.present?
    @collection.custom_date2_state = @collection.custom_date2_name.present?
    @collection.custom_date3_state = @collection.custom_date3_name.present?
  end
end
