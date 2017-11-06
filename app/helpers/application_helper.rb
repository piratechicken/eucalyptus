module ApplicationHelper
    # Takes 10000 cents and output is as $100.00
  def format_money(cents)
    money = Money.new(cents, "AUD")
    money.format
  end

end
