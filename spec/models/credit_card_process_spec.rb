require "rails_helper"

RSpec.feature CreditCardProcess, type: :model do

  it { should validate_presence_of :hash }
  it { should validate_presence_of :holder_name }
  it { should validate_presence_of :holder_birthdate }
  it { should validate_presence_of :holder_document }

  describe "#encryption_key" do

    let(:merchant) { FactoryGirl.create :merchant, moip_token: "eqyweab28moi8nn2okqwgpemmahj13v" }
    let(:product) { FactoryGirl.create :product, merchant: merchant }

    it "returns encryption key" do
      expect(subject.encryption_key).to_not be_nil
    end
  end

end
