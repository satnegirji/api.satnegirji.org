require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./api_server"
  end
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end
