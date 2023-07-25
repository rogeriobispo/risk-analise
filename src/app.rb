require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
before do
  content_type :json
end

require_relative 'health_check/controller'
require_relative 'transactions/controller'
