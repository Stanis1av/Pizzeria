require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'pizzeria.db' }

class Product < ActiveRecord::Base
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/page2' do
  erb :page2
end

post '/' do
  erb :index
end

