require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'pizzeria.db' }

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
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

post '/place_order' do
  @order = Order.new params[:order]

  if @order.save
    erb :order_placed
    # erb "<h2>Thank you!</h2><br/>Your order has been placed."
  else
    @error = @order.errors.full_messages.first
    erb "Error"
  end

end

post '/cart' do
  @orders_input = params[:orders_input]
  @items = parse_orders_input @orders_input

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

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

# check git
# to termux
