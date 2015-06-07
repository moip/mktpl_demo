require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :moip_token }
  it { should validate_presence_of :moip_id }
end
