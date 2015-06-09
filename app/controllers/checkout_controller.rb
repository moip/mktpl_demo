class CheckoutController < ApplicationController
  def new
    @checkout = CheckoutProcess.new(product_id: params[:product_id])
  end

  def create
    puts checkout_params
    @checkout = CheckoutProcess.new(checkout_params)
    @checkout.process
    if @checkout.success?
      redirect_to @checkout.credit_card
    end
  end

  private
  def checkout_params
    params.require(:checkout_process).permit(:product_id, :customer_name, :customer_email)
  end
end
