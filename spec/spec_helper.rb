ENV['RACK_ENV'] = 'test'
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require 'rspec'
require 'pry'
require 'pg'
require 'List'
require 'Task'

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
  end
end
