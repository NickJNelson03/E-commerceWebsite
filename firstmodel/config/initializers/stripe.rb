Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_51PEcMpGn2QlUiNHleLn7uzlMsaAqiVATKAaAfeulwWJeKxVCNstaqrYUI9Hi4oeqJNWBqxzJzClixrorbybSTHgu00YBATIAh2'],
  secret_key: ENV['sk_test_51PEcMpGn2QlUiNHlnQY2dxinkT15tX5HmkbKGmkQOcDktCBYhn2MNZFI8SvuasjIu1pnTlhV7V1ztwRRSd54XnZJ003HdEH3jz']
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
