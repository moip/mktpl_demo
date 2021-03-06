Rails.application.config.middleware.use OmniAuth::Builder do
  provider :moip, ENV["CLIENT_ID"], ENV["CLIENT_SECRET"],
    {
      environment: :sandbox,
      redirect_uri: "https://moipdevcommerce.herokuapp.com",
      scope: "CREATE_ORDER",
    }
end
