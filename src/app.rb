require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require 'redis'

before do
  content_type :json
end
require_relative '../config/dotenv'
require_relative 'health_check/controller'
require_relative 'transactions/controller'
require_relative 'shared/providers/cache/redis_provider'


