class Event
  attr_reader :data
  def initialize(data)
    @data = JSON.parse(data.to_json)
  end

  def event_date
    (data["start"] && data["start"]["dateTime"]).try(:to_time)
  end

  def event_day
    Date::DAYNAMES[event_date.wday] if event_date
  end

  def summary
    data["summary"]
  end

  def description
    data["description"]
  end

  def url
    data["htmlLink"]
  end

  def event_time
    event_date.strftime("%I:%M %p") if event_date
  end

  def organizer
    data["organizer"] &&  data["organizer"]["displayName"]
  end
end
