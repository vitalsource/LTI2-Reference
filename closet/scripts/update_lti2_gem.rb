#!/usr/bin/env ruby

PROJECT_PATH = File.expand_path('../../..', __FILE__)

gems = [:lti2_commons, :lti2_tc, :lti2_tp]

def update_gem(gem)
  puts "Updating #{gem}"
  system("rm -rf /tmp/#{gem}")
  system("git clone git@github.com:jtibbetts/#{gem}.git")
  system("cp -R ~/git/lti2_reference/#{gem} /tmp/#{gem}")
  system("git add .")
  system("git commit -am 'update gem'")
  system("git push")
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







