CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'c00p75-cycle-cruise'
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
    # region:            "us-east-1", # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }

  Aws::S3::Client.new(region: 'us-west-2')
  # puts "AWS SDK region: #{config.aws_credentials[:region]}"
end
