require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :image }
  it { should validate_presence_of :price }

  it { should belong_to :merchant }
end
