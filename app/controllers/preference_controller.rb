class PreferenceController < ApplicationController

  def update
    session[:theme] = params[:theme] if params[:theme].present?
    session[:language] = params[:language] if params[:language].present?
    redirect_to request.referrer || root_path
  end

end
