FactoryGirl.define do
  factory :product do
    title Faker::Commerce.product_name
    image Faker::Avatar.image
    price (Faker::Commerce.price * 100).to_i
  end

end
