  Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['Facebook_app_key'], ENV['Facebook_secret']
    end