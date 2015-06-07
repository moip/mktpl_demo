require 'rails_helper'

RSpec.feature "Showcases", type: :feature do

  let!(:product) { FactoryGirl.create :product, merchant: FactoryGirl.create(:merchant) }

  scenario "Customer vists showcase page" do
    visit "/"

    expect(page).to have_text(product.title)
  end

end
