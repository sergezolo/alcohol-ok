Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    provider :facebook, "472287907078175", "a20fb1383868b03a47a07456b79f7b72"
end