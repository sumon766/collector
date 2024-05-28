class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_user, only: [:update_user_status, :update_user_role]

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

  private

  def authorize_admin
    authorize :admin, :index?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
