module ConversationsHelper

  def seller_full_name
    @conversation.listing.user.profile.full_name
  end

  def seller_name
    @conversation.listing.user.profile.first_name
  end

  def format_last_message_time(datetime)
    if datetime.today?
      datetime.in_time_zone('Sydney').strftime("%I:%M%p")
    elsif datetime >= (Date.today - 7)
      datetime.in_time_zone('Sydney').strftime("%A")
    else
      datetime.in_time_zone('Sydney').strftime("%m/%d/%Y")
    end
  end

  def other_user(conversation)
    if conversation.listing.user == current_user
      conversation.buyer.profile
    else
      conversation.listing.user.profile
    end
  end

end
