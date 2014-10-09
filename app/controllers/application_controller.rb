class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :store_location, unless: -> (arg) { user_signed_in? }

  def authenticate_user!
    unless user_signed_in?
      redirect_to user_omniauth_authorize_path(:facebook)
    end
  end
  
  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    handle_unsaved_curiosity
    if resource.sign_in_count == 1
      return edit_user_path(resource)
    end

    return session.delete(:previous_url) || root_path
  end

  private
  def handle_unsaved_curiosity
    if curiosity_params = session.delete(:unsaved_curiosity)
      @curiosity = Curiosity.new(curiosity_params)
      @curiosity.user = resource
      @curiosity.save
      return curiosity_share_path(@curiosity)
    end
  end
end
