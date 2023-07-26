require 'sinatra'
require 'sinatra/json'
require "sinatra/activerecord"
require 'sinatra/reloader' if development?
require 'redis'
require 'sinatra/strong-params'
require 'pry' if development?
require 'pry-nav' if development?
require 'pry-remote' if development?

require_relative '../config/dotenv'
require_relative '../config/database'
require_relative 'shared/providers/cache/redis_provider'
require_relative 'health_check/routes/health'
require_relative 'transactions/routes/transactions'
require_relative 'transactions/model/transaction'
require_relative 'transactions/use_cases/create_transaction'

before do
  content_type :json
end

