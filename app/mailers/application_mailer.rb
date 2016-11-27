class ApplicationMailer < ActionMailer::Base
  default from: 'muvin@heroku.com'
  layout 'mailer'
end
