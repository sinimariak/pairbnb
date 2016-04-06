  Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, ENV['Facebook_app_id'], ENV['Facebook_secret'], info_fields: 'first_name,last_name,email'
    end