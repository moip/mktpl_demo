FactoryGirl.define do
  factory :merchant do
    name Faker::Company.name
    moip_token Faker::Number.number(12)
    moip_id Faker::Number.number(10)
  end

end
