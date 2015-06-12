require 'rails_helper'

RSpec.feature "Checkouts", type: :feature do
  let(:merchant) { FactoryGirl.create :merchant, moip_token: "eqyweab28moi8nn2okqwgpemmahj13v" }
  let!(:product) { FactoryGirl.create :product, merchant: merchant }
  scenario "checkout an item" do
    visit "/"
    click_button "purchase"

    expect(page).to have_text(product.title)

    fill_in "Name", with: "Some Customer"
    fill_in "Email", with: "some@email.com"
    click_button "Order"
  end
end
