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
  erb(:new_square_root)
end

get'/square_root/results' do
  @input = params.fetch("user_number")
  @input_root = Math.sqrt(@input.to_f)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get '/payment/results' do
  @apr = params.fetch("user_apr").to_f.round(4)
  @aprWithPercentSign = @apr.to_s + "%"
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f.round(2)
  @principalFormatted = "$" + @principal.to_s
  aprDecimal = @apr/100
  aprDecimalMonthly = aprDecimal / 12
  numerator = aprDecimalMonthly * @principal
  totalMonths = 12 * @years
  aprPlusOne = aprDecimalMonthly + 1
  denominator = 1 - (aprPlusOne**-totalMonths)
  payment = numerator / denominator
  @monthlyPayment = "$" + payment.round(2).to_s
  erb(:payment_results)
end
