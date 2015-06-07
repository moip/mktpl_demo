class Product < ActiveRecord::Base
  validates_presence_of :title, :image, :price

  belongs_to :merchant
end
