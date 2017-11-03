module ConversationsHelper

def seller_full_name
  @conversation.listing.user.profile.full_name
end
def seller_name
  @conversation.listing.user.profile.first_name
end

end
