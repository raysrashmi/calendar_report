class HomeController < ApplicationController
  def index
    if current_user
      client = Google::APIClient.new
      client.authorization.access_token = current_user.oauth_token
      service = client.discovered_api('calendar', 'v3')
      @result = client.execute(
        api_method: service.events.list,
        parameters: {'calendarId' => 'primary'},
        headers: {'Content-Type' => 'application/json'})

    end
  end
end
