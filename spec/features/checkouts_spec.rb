require 'rails_helper'

RSpec.feature "Checkouts", type: :feature do
  let!(:product) { FactoryGirl.create :product, merchant: FactoryGirl.create(:merchant) }
  scenario "checkout an item" do
    visit "/"
    click_button "purchase"

    expect(page).to have_text(product.title)

    fill_in "Name", with: "Some Customer"
    fill_in "Email", with: "some@email.com"
    click_button "Order"
  end
end
