require "sinatra"
require "sinatra/reloader"
require "active_support/all"

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
  apr = params.fetch("user_apr").to_f
  aprFormatted = '%.4f' % apr
  @aprWithPercentSign = aprFormatted.to_s + "%"
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f
  @principalFormatted = @principal.to_fs(:currency)
  aprDecimal = apr/100
  aprDecimalMonthly = aprDecimal / 12
  numerator = aprDecimalMonthly * @principal
  totalMonths = 12 * @years
  aprPlusOne = aprDecimalMonthly + 1
  denominator = 1 - (aprPlusOne**-totalMonths)
  payment = numerator / denominator
  @monthlyPayment = payment.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get '/random/results' do
  @min = params.fetch("user_min").to_f.round(1)
  @max= params.fetch("user_max").to_f.round(1)

  @randomNum = rand(@min..@max).round(15)
  erb(:random_results)

end
