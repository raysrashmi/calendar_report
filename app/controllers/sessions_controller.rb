class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id if user
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def unsubscribe
    session[:user_id] = nil
    user = User.find(params[:id])
    session[:user_id] = nil if user.destroy
    redirect_to root_path
  end
end
