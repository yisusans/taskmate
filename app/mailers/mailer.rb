class Mailer < ApplicationMailer

	def test_email(user)
	  	@user = user
	  	mail to: "#{user.email}", subject: "Success! test email delivered."
	end

	def weekly_email(user)
		@user = user
		mail to: "#{user.email}", subject: "Hi #{user.name}, here's your weekly taskmate update."
	end

	def daily_email(user)
		@user = user
		mail to: "#{user.email}", subject: "Hey #{user.name}, you have some tasks assigned to you that are due soon."
	end



end
