
namespace :init_task do

  desc "Reseed and backup all--assumes current is canonic"
  task :backup  => :environment do
    puts 'seed'
    system "rake db:seed RAILS_ENV=mysql"
    puts 'dump'
    system "rake db:dump RAILS_ENV=mysql"
    puts "load mysql"
    system "rake db:load RAILS_ENV=mysql"
    puts "mysqldump to closet/backups"
    system "mysqldump tcsampleapp -u ltiuser --password=ltipswd >> ../closet/backups/tcsampleapp.sql"
    puts "load sqlite3"
    system "rake db:load RAILS_ENV=sqlite3"
    puts "copy sqlite3 to closet/backups"
    system "cp db/development.sqlite3 ../closet/backups/tcsampleapp.sqlite3"
  end

  desc "Truncate the wirelog"
  task :truncate_wirelog => :environment do
    wire_log_file = File.truncate(Rails.application.config.wire_log.output_file_name, 0)
  end
end
