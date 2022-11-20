module LogsHelper
  def log_date(date)
    date.strftime("Created on %d - %b %Y  %H:%M")
  end
end
