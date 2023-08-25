CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'c00p75'
  config.aws_acl    = 'private'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching.
  config.aws_attributes = -> { {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  } }

  config.aws_credentials = {
    access_key_id:     ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_KEY'],
    region:            us-west-2, # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }
  # config.fog_credentials = {
  #   provider:              'AWS',                        # required
  #   aws_access_key_id:      ENV['AWS_ACCESS_KEY'],                        # required unless using use_iam_profile
  #   aws_secret_access_key:  ENV['AWS_SECRET_KEY'],                        # required unless using use_iam_profile
  #   # use_iam_profile:       true,                         # optional, defaults to false
  #   region:                ENV['AWS_REGION'],                  # optional, defaults to 'us-east-1'
  #   # host:                  's3.example.com',             # optional, defaults to nil
  #   # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  # }
  # config.fog_directory  = 'c00p75'                                      # required
  # config.fog_public     = false                                                 # optional, defaults to true
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  # For an application which utilizes multiple servers but does not need caches persisted across requests,
  # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
  # config.cache_storage = :file
end
