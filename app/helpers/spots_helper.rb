module SpotsHelper
  def display_day(date)
    if date.to_date == Date.today
      "today"
    elsif date.to_date == Date.yesterday
      "yesterday"
    elsif (date.to_date > Date.today - 7) && (date.to_date < Date.yesterday)
      "weekday"
    else
      date.strftime("dd.mm.")
    end
  end
end
