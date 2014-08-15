CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS', # required
    :aws_access_key_id => ENV["AWS_ACCESS_KEY_ID"], # required
    :aws_secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"], # required
    :region => 'us-west-1'
  }
  config.fog_directory = "frame-it-#{Rails.env}"

  if Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
  end
end
