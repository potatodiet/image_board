CarrierWave.configure do |config|
  config.storage = :file if Rails.env.development? || ENV['STORAGE_TYPE'] == 'local'

  if Rails.env.production? || ENV['STORAGE_TYPE'] == 'aws'
    config.storage = :aws
    config.aws_bucket = ENV.fetch('AWS_BUCKET_NAME')
    config.aws_acl    = 'private'

    # The maximum period for authenticated_urls is only 7 days.
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    config.aws_attributes = lambda {
      {
        expires: 1.week.from_now.httpdate,
        cache_control: 'max-age=604800'
      }
    }

    config.aws_credentials = {
      access_key_id: ENV.fetch('AWS_ACCESS_KEY'),
      secret_access_key: ENV.fetch('AWS_SECRET_KEY'),
      region: ENV.fetch('AWS_REGION'),
      endpoint: ENV.fetch('AWS_ENDPOINT')
    }
  end
end
