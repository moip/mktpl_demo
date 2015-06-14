class CreditCardProcess
  include ActiveModel::Model

  attr_accessor :order_id, :hash, :holder_name, :holder_birthdate, :holder_document

  validates_presence_of :hash, :holder_name, :holder_birthdate, :holder_document

end
