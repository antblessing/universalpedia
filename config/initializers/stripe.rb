 # Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_SXcGpIDT4qGL5nHOk5PNDFwl '],
  secret_key: ENV['sk_test_XwlNyqd85vFNlmYm45QRXTu2 ']
}
 
# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]