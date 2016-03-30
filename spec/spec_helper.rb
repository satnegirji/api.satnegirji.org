ENV['RACK_ENV'] = 'test'

require "minitest/autorun"
require 'rack/test'
require_relative '../api_server.rb'
require_relative '../lib/language.rb'

require_relative '../models/translation'
require_relative '../models/word'

include Rack::Test::Methods

def app
  Sinatra::Application
end
