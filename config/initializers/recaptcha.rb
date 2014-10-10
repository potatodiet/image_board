Recaptcha.configure do |config|
  config.public_key  = Settings.recaptcha.public_key
  config.private_key = Settings.recaptcha.private_key
  config.use_ssl_by_default = true
end
