class FetchEvent
  def self.all
    #if Date.today.wday == 2 #send email only on monday 00:00
      User.all.each do |user|
        events = UserEvent.new(user).run
        if events.count > 0
          CalendarMailer.
            weekly_events(user, events).
            deliver
        end
      end
    #end
  end
end
