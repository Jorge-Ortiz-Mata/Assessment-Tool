class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.sendgrid_valid_email
  layout "mailer"
end
