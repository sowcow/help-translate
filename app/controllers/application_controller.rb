class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?, :guest?, :admin?, :forbidden, :authorized?

  private
 
  def authorized? action, resource=nil
    return true if admin?

    adding = [:new, :create].include? action
    viewing= [:index, :show].include? action
    changing = not(adding or viewing)

    if guest?
      adding or viewing
    else
      adding or viewing or (changing and resource.user_id == current_user.id)
    end      
  end 

  def admin?
    false
  end
    
  Guest = 'guest'
  
 
  def current_user
    get_user || User.find_or_create_by_name(Guest)
  end
  def signed_in?
    not( get_user.nil? || get_user.name == Guest )
  end
  def guest?
    not signed_in?
  end

  def forbidden
    render text: 'forbidden', status: 403
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
