#!/usr/bin/env ruby

PROJECT_PATH = File.expand_path('../../..', __FILE__)

gems = [:lti2_commons, :lti2_tc, :lti2_tp]

def update_gem(gem)
  puts "Updating #{gem}"
  system <<STR
rm -rf /tmp/#{gem}
cd /tmp
git clone git@github.com:vitalsource/#{gem}.git
cd /tmp/#{gem}
cp -R #{PROJECT_PATH}/#{gem} /tmp/#{gem}
git add .
git commit -am 'update gem'
git push
STR
end

args = ARGV.map {|elmt| elmt.to_sym}

if args.include? :all
  gems.each {|arg| update_gem(arg)}
else
  args.each do |arg|
    if gems.include? arg
      update_gem(arg)
    else
      puts "warning: #{arg} is not a valid gem"
    end
  end
end
