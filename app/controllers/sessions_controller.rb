class SessionsController < ApplicationController
  def create
    @merchant = Merchant.find_or_create_by(moip_id: auth_hash.uid)
    @merchant.name = auth_hash.uid
    @merchant.moip_token = auth_hash["credentials"]["token"]
    @merchant.save
    session[:current_user] = @merchant
    flash[:info] = "User logged in: #{@merchant.moip_id}"
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
