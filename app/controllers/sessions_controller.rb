class SessionsController < ApplicationController
  def create
    p"---------------"
    p request.env["omniauth.auth"]
    p"=================="
  end
end
