class SoldMailer < ApplicationMailer
  def sold_notification(listing, buyer)
    @listing = listing
    @buyer = buyer
    mail(to: @listing.user.email, subject: "Eucalyptus listing sold: #{@listing.title}")
  end
end
