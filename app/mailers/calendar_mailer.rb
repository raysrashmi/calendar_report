class CalendarMailer < ActionMailer::Base
  default from: "calendar@raysrashmi.com"

  def weekly_events(user, events)
    @user = user
    @events = events
    mail(to: user.email, subject: 'Next week events')
  end
end
