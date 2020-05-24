RailsAdmin.config do |config|
  require 'i18n'
  I18n.default_locale = :ja

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit
end