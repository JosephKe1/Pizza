require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/contact.db")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :comments, Text

end

DataMapper.auto_upgrade!

get '/' do
  erb(:order, {layout: :default_layout})
end

get '/order' do
  erb(:order, {layout: :default_layout})
end

post '/order' do
  @first_name = params["first_name"]
  @last_name = params["last_name"]
  @street = params["street"]
  @apt = params["apt"]
  @city = params["city"]
  @province = params["province"]
  @postal = params["postal"]
  @email = params["postal"]
  @phone = params["phone"]
  @size = params["size"]
  @size = params["size"]
  @size = params["size"]
  @size = params["size"]
  @pizza = params["pizza"]
  @quantity = params["quantity"]
  @conversion = (@size.to_f * @quantity.to_f)
  p params
  p @conversion
  erb(:order_complete, {layout: :default_layout})
end

get '/about' do
  erb(:about, {layout: :default_layout})
end

get '/contact' do
  erb(:contact, {layout: :default_layout})
end

post '/contact' do
  Contact.create params
  erb(:thank_you, {layout: :default_layout})
end
