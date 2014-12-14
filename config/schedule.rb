every :sunday, :at => '12pm' do # Use any day of the week or :weekend, :weekday
  runner "FetchEvent.all"
end
