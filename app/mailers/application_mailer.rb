class ApplicationMailer < ActionMailer::Base
  default from: "taskmate.info@gmail.com"
  layout 'mailer'

  def test_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'test email')
  end
end
