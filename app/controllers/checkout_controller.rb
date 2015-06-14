class CheckoutController < ApplicationController
  def new
    @checkout = CheckoutProcess.new(product_id: params[:product_id])
  end

  def create
    @checkout = CheckoutProcess.new(checkout_params)
    @checkout.process

    redirect_to @checkout.boleto
  end

  def create_credit_card
    @checkout = CheckoutProcess.new(checkout_cc_params)
    @checkout.process_cc
    puts @checkout.payment
  end

  private
  def checkout_params
    params.require(:checkout_process).permit(:product_id, :customer_name, :customer_email)
  end

  def checkout_cc_params
    params.require(:checkout_process)
    .permit(:product_id, :customer_name, :customer_email,
            :hash, :holder_name, :holder_birthdate, :holder_document)
  end
end
