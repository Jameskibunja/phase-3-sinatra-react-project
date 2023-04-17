# This is an _environment variable_ that is used by some of the Rake tasks to determine
# if our application is running locally in development, in a test environment, or in production
ENV['RACK_ENV'] ||= "production"

# Require in Gems
require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

# Require in all files in 'app' directory
require 'require_all'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'sinatra/base'

# Require all model files
Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each { |file| require file }

# Require ApplicationController first
require File.join(File.dirname(__FILE__), "../app/controllers/application_controller.rb")

# Require all other controller files
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each { |file| require file }
