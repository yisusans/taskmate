require 'rake'

task :send_weekly_email => :environment do
  users = User.all

  if Date.today.cwday == 6
    users.each do |user|
    puts "Sending weekly emails..."
    Mailer.test_email(user).deliver
    end
  end
end

task :send_daily_email => :environment do
  users = User.all
  users.each do |user|
    if user.assigned_tasks.any? {|task| task.completions.length == 0 && task.due_date <= (Date.today + 2.days)}
        puts "Sending daily email to #{user.email}..."
        Mailer.test_email(user).deliver
    end
  end
end