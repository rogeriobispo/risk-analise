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
require_relative 'transactions/use_cases/end_validations'
require_relative 'transactions/use_cases/user_has_charge_back'
require_relative 'transactions/use_cases/transaction_frame_permited'
require_relative 'transactions/use_cases/max_transaction_in_a_row'
require_relative 'transactions/use_cases/start_validations'

before do
  content_type :json
end

