class UserEvent
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def run
    items = result_data.map{|item| Event.new(item)}
    items = items.group_by{|event| event.event_day}
    items
  end

  def result_data
    client = Google::APIClient.new
    client.authorization.access_token = user.oauth_token
    client.authorization.refresh_token = user.refresh_token
    if client.authorization.refresh_token && client.authorization.expired?
      Rails.logger.info "client.authorization.fetch_access_token!"
      client.authorization.fetch_access_token!
    end
    service = client.discovered_api('calendar', 'v3')
    result = client.execute(
      api_method: service.events.list,
      parameters: {'calendarId' => 'primary',
                   'timeMin' => Time.now.to_datetime.rfc3339,
                   'timeMax' => (Time.now + 7.days).to_datetime.rfc3339},
       headers: {'Content-Type' => 'application/json'})
    result.data.items
  end
end
