# require 'rake'

task :send_weekly_email => :environment do
  users = User.all

  users.each do |user|
    puts "Sending weekly emails..."
    Mailer.test_email(user).deliver
  end
end

task :send_daily_email => :environment do
  users = User.all

  users.each do |user|
    puts "Sending daily emails..."
    Mailer.test_email(user).deliver
  end
end