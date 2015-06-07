class ShowcaseController < ApplicationController

  def index
    @products = Product.all
  end
end
