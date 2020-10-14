require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'pizzeria.db' }

class Product < ActiveRecord::Base
end

get '/' do
  @products = Product.all
  erb :index
end

get '/menu' do
  erb :menu
end

get '/about' do
  erb :about
end


post '/cart' do
  orders_input = params[:orders]
  @orders = parse_orders_input orders_input

  erb :cart
end


post '/' do
  erb :index
end


def parse_orders_input (orders_input)

  arr = []

  o_1 = orders_input.split(/\,/)

  o_1.each do |v|

    o_2 = v.split('=')
    o_3 = o_2[0].split(/_/)

    id = o_3[1]
    cnt = o_2[1]

    arr2 = [id, cnt]

    arr.push arr2

  end

  return arr
end
