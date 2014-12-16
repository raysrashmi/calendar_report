class HomeController < ApplicationController
  def index
    if current_user
      @events = UserEvent.new(current_user).run
    end
  end
end
