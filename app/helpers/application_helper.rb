module ApplicationHelper
  def format_price(price)
    price.to_s.rjust(3, "0").insert(-3, ",")
  end
end
