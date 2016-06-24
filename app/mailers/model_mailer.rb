class ModelMailer < ApplicationMailer
	default from: "hi@taskmate.com"

	def test_email(user)
		@user = user
		mail(to: @user.email, subject: 'test email')
	end
end
