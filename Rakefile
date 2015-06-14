# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :populate_db => :environment do
  Merchant.all.each do |m|
    Product.create title: Faker::Commerce.product_name, image: Faker::Avatar.image, price: (Faker::Commerce.price * 100).to_i, merchant: m
  end
end
