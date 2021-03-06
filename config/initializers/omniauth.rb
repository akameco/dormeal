Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
           Rails.application.secrets.twitter_api_key,
           Rails.application.secrets.twitter_api_secret,
           {
             :secure_image_url => 'true',
             :use_authorize    => 'true'
           }
end

OmniAuth.config.logger = Rails.logger
