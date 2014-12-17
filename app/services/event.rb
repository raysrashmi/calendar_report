class Event
  attr_reader :data
  def initialize(data)
    @data = JSON.parse(data.to_json)
  end

  def start_date
    (data["start"] && data["start"]["dateTime"]).try(:to_time)
  end

  def end_date
    (data["end"] && data["end"]["dateTime"]).try(:to_time)
  end

  def event_day
    Date::DAYNAMES[start_date.wday] if start_date
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

  def start_time
    start_date.strftime("%I:%M %p") if start_date
  end

  def end_time
    end_date.strftime("%I:%M %p") if end_date
  end

  def organizer
    data["organizer"] &&  data["organizer"]["displayName"]
  end
end
