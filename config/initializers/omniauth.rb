Rails.application.config.middleware.use OmniAuth::Builder do
  provider :moip, "APP-N8PEEE7AV17P", "q6zg0z8qxwmjzr8f0kt11qnvtwl8wg8",
    {
      environment: :sandbox,
      redirect_uri: "http://localhost:5000",
      scope: "CREATE_ORDER",
    }
end
