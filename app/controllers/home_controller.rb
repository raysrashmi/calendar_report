class HomeController < ApplicationController
  def index
    if current_user
      client = Google::APIClient.new
      client.authorization.access_token = current_user.oauth_token
      service = client.discovered_api('calendar', 'v3')
      @result = client.execute(
        api_method: service.events.list,
        parameters: {'calendarId' => 'primary',
                     'timeMin' => Time.now.to_datetime.rfc3339,
                     'timeMax' => (Time.now + 7.days).to_datetime.rfc3339},
        headers: {'Content-Type' => 'application/json'})
       @result = @result.data

    end
  end
end
