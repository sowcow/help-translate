class SessionsController < ApplicationController
  def create
    set_user User.find_or_create_from_auth_hash(auth_hash)
    redirect_to '/', notice: 'Signed in!'
  end

  def destroy
    set_user nil
    redirect_to '/', notice: 'Signed out!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
