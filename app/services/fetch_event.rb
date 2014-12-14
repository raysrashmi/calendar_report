class FetchEvent
  def self.all
    User.all.each do |user|
      CalendarMailr.UserEvent.new(user).run
    end
  end
end

class UserEvent
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def run
    client = Google::APIClient.new
    client.authorization.access_token = user.oauth_token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      api_method: service.events.list,
      parameters: {'calendarId' => 'primary',
                   'timeMin' => Time.now.to_datetime.rfc3339,
                   'timeMax' => (Time.now + 7.days).to_datetime.rfc3339},
       headers: {'Content-Type' => 'application/json'})
  end
end
