class Mailer < ApplicationMailer

	def test_email(user)
	  	@user = user
	  	mail to: "#{user.email}", subject: "Success! test email delivered."
	end
end
