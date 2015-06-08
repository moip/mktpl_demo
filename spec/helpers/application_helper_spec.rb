require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "format price" do
    it "formats price >= 1000" do
      expect(helper.format_price(1000)).to eq("10,00")
    end

    it "formats price < 1000" do
      expect(helper.format_price(850)).to eq("8,50")
    end

    it "formats price < 100" do
      expect(helper.format_price(50)).to eq("0,50")
    end
  end
end
