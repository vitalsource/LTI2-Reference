
namespace :init_task do
  desc "Do all initialization tasks"
  task :all => :environment do
    Rake::Task["init_task:re_seed"].execute
    Rake::Task["init_task:truncate_wirelog"].execute
  end
  
  desc "Reseed TC and TP"
  task :re_seed  => :environment do
    system "rake db:seed"
    tp_path = Rails.application.config.tool_consumer_registry.tool_provider_path
    system "cd #{tp_path}; rake db:load"
  end
  
  desc "Truncate the wirelog"
  task :truncate_wirelog => :environment do
    wire_log_file = File.truncate(Rails.application.config.wire_log.output_file_name, 0)
  end
end
