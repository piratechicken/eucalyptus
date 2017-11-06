module MessagesHelper

  def format_time(datetime)
    if datetime.today?
      datetime.in_time_zone('Sydney').strftime("at %I:%M%p")
    elsif datetime >= (Date.today - 7)
      datetime.in_time_zone('Sydney').strftime("on %A")
    else
      datetime.in_time_zone('Sydney').strftime("%m/%d/%Y")
    end
  end
end
