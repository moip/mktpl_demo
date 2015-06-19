class CheckoutProcess
  include ActiveModel::Model

  attr_accessor :product_id, :customer_name, :customer_email,
    :hash, :holder_name, :holder_birthdate, :holder_document

  attr_reader :order, :payment

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

  def encryption_key
    api.keys.show.keys.encryption
  end

  def success?
    valid? && order.success?
  end

  def credit_card
    order._links.checkout.pay_credit_card.redirect_href
  end

  def process
    return unless valid?

    create_order
  end

  def create_order
    # Create Moip Order
  end

  def boleto
    # Redirect to Boleto URL
  end

  def process_cc
    process

    # Create Moip Credit Card Payment
  end

  private
  def client
    auth = Moip2::Auth::OAuth.new(merchant.moip_token)
    client = Moip2::Client.new(:sandbox, auth)
  end

  def api
    Moip2::Api.new(client)
  end

end
