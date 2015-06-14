class SessionsController < ApplicationController
  def create
    puts auth_hash
    @merchant = Merchant.find_or_create_by(moip_id: auth_hash.uid)
    @merchant.name = auth_hash.uid
    @merchant.moip_token = auth_hash["credentials"]["token"]
    @merchant.save
    puts @merchant.inspect
    session[:current_user] = @merchant
    flash[:info] = "User logged in: #{@merchant.moip_id}"
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
