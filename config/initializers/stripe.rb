
if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_8ImJuaymDn2h2sgsmtvIRBPW',
    secret_key: 'sk_test_lwTiua0buO4gxvSVXEUuN1wf'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
