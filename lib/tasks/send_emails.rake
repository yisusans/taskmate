require 'rake'

task :send_weekly_email => :environment do
  users = User.all

  if Date.today.cwday == 7
    users.each do |user|
    puts "Sending weekly emails..."
    Mailer.weekly_email(user).deliver_now
    end
  end
end

task :send_daily_email => :environment do
  users = User.all
  users.each do |user|
    if user.assigned_tasks.any? {|task| task.completions.length == 0 && task.due_date <= (Date.today + 2.days)}
        puts "Sending daily email to #{user.email}..."
        Mailer.daily_email(user).deliver_now
    end
  end
end