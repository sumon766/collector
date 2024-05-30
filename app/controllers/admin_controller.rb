class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_user, only: [:update_user_status, :update_user_role, :user_collections]
  before_action :set_collection, only: [:collection_items]

  def index
    @users = User.order(created_at: :desc)
  end

  def update_user_status
    if @user.update(status: params[:status])
      redirect_to admin_index_path, notice: 'User status was successfully updated'
    else
      redirect_to admin_index_path, alert: 'Failed to update user status'
    end
  end

  def update_user_role
    new_role = params[:role]

    if User.roles.keys.include?(new_role) && @user.update(role: new_role)
      if @user == current_user && new_role != 'admin'
        redirect_to root_path, notice: 'You have been removed from the admin role'
      else
        redirect_to admin_index_path, notice: 'User role was updated successfully'
      end
    else
      redirect_to admin_index_path, alert: 'Failed to update user role'
    end
  end

  def user_collections
    @collections = @user.collections
  end

  def collection_items
    @items = @collection.items
  end

  def collection_new

  end

  def create_collection
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to admin_user_collections_path(@user), notice: "Collection was created successfully"
    else
      render :collection_new
    end
  end

  def create_item
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_collection_items_path(@item.collection), notice: 'Item was successfully created.'
    else
      render :new_item
    end
  end

  private

  def authorize_admin
    authorize :admin, :index?
  end

  def set_user
    @user = User.find(params[:id])
  end

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
