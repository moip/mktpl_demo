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

  def process
    return unless valid?

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

  def process_cc
    process

    @payment = Moip2::PaymentApi.new(client).create(order.id,
      {
        installment_count: 1,
        funding_instrument: {
          method: "CREDIT_CARD",
          credit_card: {
            hash: hash,
            holder: {
              fullname: holder_name,
              birthdate: holder_birthdate,
              tax_document: {
                type: "CPF",
                number: holder_document,
              },
            }
          }
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

  def boleto
    order._links.checkout.pay_boleto.redirect_href
  end

  def encryption_key
    Moip2::KeysApi.new(client).show.keys.encryption
  end

  private
  def client
    auth = Moip2::Auth::OAuth.new(merchant.moip_token)
    client = Moip2::Client.new(:sandbox, auth)
  end

end
