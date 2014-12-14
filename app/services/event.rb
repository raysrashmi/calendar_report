class Event
  attr_reader :data
  def initialize(data)
    @data = JSON.parse(data.to_json)
  end

  def event_date
    (data["start"]["dateTime"]).to_time
  end

  def event_day
    Date::DAYNAMES[event_date.wday]
  end

  def summary
    data[:summary]
  end

  def description
    data["description"]
  end

  def url
    data["htmlLink"]
  end

  def event_time
    [event_date.hour, event_date.min].join(":")
  end
end
