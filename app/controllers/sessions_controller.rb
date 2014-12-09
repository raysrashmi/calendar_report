class SessionsController < ApplicationController
  def create
    p"---------------"
    p request.env["omniauth.auth"]
    p"=================="
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end
end
