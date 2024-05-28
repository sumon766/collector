class AdminController < ApplicationController
  before_action :authorize_admin

  def index
    @users = User.all
  end

  private

  def authorize_admin
    authorize :admin, :index?
  end
end