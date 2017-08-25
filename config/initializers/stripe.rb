Rails.configuration.stripe = {
  :publishable_key => 'pk_test_2WnAkVgGiwbzQ24Zu5bEPOMY',
  :secret_key      => 'sk_test_cpJ2GqkYoeq5wlApT8QAiBcn'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]