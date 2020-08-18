ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :env do 
    require './config/environment.rb'
end

task :console => :env do    # '=>' tells this task to first load the ':env' task and make sure our environment is first loaded
    Pry.start 
end