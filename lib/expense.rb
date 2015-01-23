class Expense
  attr_reader(:id, :name, :amount, :date)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @amount = attributes.fetch(:amount)
    @date = attributes.fetch(:date)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (name, amount, date) VALUES ('#{@name}', '#{@amount}', '#{@date}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_method(:==) do |another_expense|
    self.name() == another_expense.name() && self.amount() == another_expense.amount() && self.date() == another_expense.date()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |expense|
      name = expense.fetch("name")
      amount = expense.fetch("amount").to_f()
      date = expense.fetch("date")
      expenses.push(Expense.new({ :name => name, :amount => amount, :date => date }))
    end
    expenses
  end
end
