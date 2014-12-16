class FetchEvent
  def self.all
    User.all.each do |user|
      CalendarMailer.
        weekly_events(user, UserEvent.new(user).run).
        deliver
    end
  end
end
