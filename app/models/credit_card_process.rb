class CreditCardProcess
  include ActiveModel::Model

  attr_accessor :merchant_id, :order_id, :hash,
    :holder_name, :holder_birthdate, :holder_document

  validates_presence_of :order_id, :hash, :holder_name, :holder_birthdate, :holder_document

  def encryption_key
    keys = api.keys.show
    keys.keys.encryption
  end

  def api
    @api ||= Moip2::Api.new(client)
  end

  def client
    auth = Moip2::Auth::OAuth.new(merchant.moip_token)
    Moip2::Client.new(:sandbox, auth)
  end

  def merchant
    @merchant ||= Merchant.find(merchant_id)
  end
end
