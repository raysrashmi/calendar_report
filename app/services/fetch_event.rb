class FetchEvent
  def self.all
    if Date.today.wday == 0 #send email only on sunday
      User.all.each do |user|
        CalendarMailer.
          weekly_events(user, UserEvent.new(user).run).
          deliver
      end
    end
  end
end
