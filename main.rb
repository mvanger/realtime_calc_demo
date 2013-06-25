require 'sinatra'
require 'sinatra/reloader' if development?

get "/" do
  return "Hello!"
end

get '/hello_world' do
  "Hello, World!"
end

get '/hello_me' do
  @me = "Mike"
  return "Hello, #{@me}"
end

get '/hello_you/:name' do
  @name = params[:name]
  return "Hello, #{@name}"
end

# localhost:4567/names/first/last
get '/names/:first/:last' do
  @first = params[:first]
  @last = params[:last]
  return "You can do multiple parameters,
          #{@first.capitalize} #{@last.capitalize}"
end

# localhost:4567/calc/add/1/2
get '/calc/add/:first/:second' do
  @first = params[:first].to_i      # convert to integer
  @second = params[:second].to_i
  return (@first + @second).to_s    # convert back to string
end

get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first * @second).to_s
end

get '/calc/subtract/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first - @second).to_s
end

get '/calc/divide/:first/:second' do
  @first = params[:first].to_f
  @second = params[:second].to_i
  return (@first / @second).to_s
end

get '/oh_hai/:name' do
  @answer_to_universe = 42
  @name = params[:name]
  erb :hai
end

get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  # Valid operations: sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
    when "sum" then @first + @second
    when "difference" then @first - @second
    when "product" then @first * @second
    when "quotient" then @first / @second
  end
  erb :calc
end

get '/calc' do
  @first = params[:first].to_f
  # Valid operations: sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
    when "sum" then @first + @second
    when "difference" then @first - @second
    when "product" then @first * @second
    when "quotient" then @first / @second
  end
  erb :calc
end


