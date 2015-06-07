class Merchant < ActiveRecord::Base
  validates_presence_of :name, :moip_token, :moip_id
end
