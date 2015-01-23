require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/expense')
require("./lib/category")
require("pg")

DB = PG.connect({ :dbname => "budget" })


get('/') do
  @entries = Expense.all()
  @types = Category.all()
  erb(:index)
end

post("/types") do
    type = params.fetch("type")
    category = Category.new({ :name => type })
    category.save()
    @types = Category.all()
  erb(:index)
end

post("/purchases") do
  purchase = params.fetch("purchase")
  cost = params.fetch("cost")
  purchase_date = params.fetch("purchase_date")
  entry = Expense.new({ :name => purchase, :amount => cost, :date => purchase_date })
  entry.save()
  @entries = Expense.all()
  erb(:index)
end
