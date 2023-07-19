require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  erb(:square_results)
end

get("/square_root/new") do
end

get("/payment/new") do
end
