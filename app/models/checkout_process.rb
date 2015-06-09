class CheckoutProcess
  include ActiveModel::Model

  attr_accessor :product_id, :customer_name, :customer_email

  attr_reader :order

  validates_presence_of :product_id, :customer_name, :customer_email

  def product
    @product ||= Product.find(product_id)
  end

  def merchant
    product.merchant
  end

  def generate_own_id
    SecureRandom.uuid
  end

  def process
    return unless valid?

    auth = Moip2::Auth::OAuth.new(merchant.moip_token)
    client = Moip2::Client.new(:sandbox, auth)
    @order = Moip2::OrderApi.new(client).create(
      {
        own_id: generate_own_id,
        items: [
          {
            product: product.title,
            quantity: 1,
            detail: product.title,
            price: product.price
          }
        ],
        customer: {
          own_id: "customer_#{generate_own_id}",
          fullname: customer_name,
          email: customer_email,
        }
      }
    )
  end

  def success?
    valid? && order.success?
  end

  def credit_card
    order._links.checkout.pay_credit_card.redirect_href
  end

end
