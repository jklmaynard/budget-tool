require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/expense')
require("pg")

DB = PG.connect({ :dbname => "budget" })

get('/') do
  @entries = Expense.all()
  erb(:index)
end

post("/") do
  purchase = params.fetch("purchase")
  cost = params.fetch("cost")
  purchase_date = params.fetch("purchase_date")
  entry = Expense.new({ :name => purchase, :amount => cost, :date => purchase_date })
  entry.save()
  @entries = Expense.all()
  erb(:index)
end
