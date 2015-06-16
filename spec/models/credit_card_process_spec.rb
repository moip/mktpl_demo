require "rails_helper"

RSpec.feature CreditCardProcess, type: :model do

  it { should validate_presence_of :order_id }
  it { should validate_presence_of :hash }
  it { should validate_presence_of :holder_name }
  it { should validate_presence_of :holder_birthdate }
  it { should validate_presence_of :holder_document }

  let(:merchant) { FactoryGirl.create :merchant, moip_token: "k2xygi29niy8sag0m15s2cb4wbd74np" }
  let(:product) { FactoryGirl.create :product, merchant: merchant }
  let(:subject) { described_class.new(merchant_id: merchant.id) }

  describe "#encryption_key" do
    it "returns encryption key" do
      VCR.use_cassette "credit_card_process_begin" do
        expect(subject.encryption_key).to start_with("-----BEGIN PUBLIC KEY-----")
      end
    end
  end

end
