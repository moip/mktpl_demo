require "rails_helper"

RSpec.feature CheckoutProcess, type: :model do
  let(:merchant) { FactoryGirl.create :merchant, moip_token: "eqyweab28moi8nn2okqwgpemmahj13v" }
  let(:product) { FactoryGirl.create :product, merchant: merchant }
  let(:checkout) do
    described_class.new(
      product_id: product.id,
      customer_name: "Some Customer",
      customer_email: "some@email.com"
    )
  end 

  it { should validate_presence_of :product_id }
  it { should validate_presence_of :customer_name }
  it { should validate_presence_of :customer_email }

  describe "#product" do
    it "loads product" do
      expect(checkout.product).to eq(product)
    end
  end

  describe "#process" do
    before do
      checkout.process
    end

    it { expect(checkout).to be_success }

    it "return link to moip checkout paying with credit card" do
      expect(checkout.credit_card).to_not be_nil
    end

    it "return link to moip checkout paying with boleto" do
      expect(checkout.boleto).to_not be_nil
    end
  end
end
