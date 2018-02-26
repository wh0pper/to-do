require 'capybara/rspec'
require './app'
require 'pry'
require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)
