class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?, :guest?, :admin?

  private
  
  def admin?
    false
  end
    
  G = 'guest'
  
 
  def current_user
    get_user || User.find_or_create_by_name(G)
  end
  def signed_in?
    not( get_user.nil? || get_user.name == G )
  end
  def guest?
    not signed_in?
  end



  def get_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def set_user user
    session[:user_id] = (@current_user = user).try(:id)
    #@current_user = user
    #user.nil? ?  session[:user_id] = nil : session[:user_id] = user.id
  end
end
