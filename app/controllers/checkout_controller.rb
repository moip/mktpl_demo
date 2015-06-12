class CheckoutController < ApplicationController
  def new
    @checkout = CheckoutProcess.new(product_id: params[:product_id])
  end

  def create
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
