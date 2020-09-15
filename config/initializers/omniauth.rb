Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    #provider :facebook, "5547228790707817555", "a20fb1383868b03a47a07456b79f7b725555"
end