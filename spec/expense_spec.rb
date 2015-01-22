require('spec_buddy')

describe(Expense) do
  describe("#name") do
    it("return name of the expense") do
      test_expense = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-25" })
      expect(test_expense.name()).to eq("candy bar")
    end
  end

  describe("#amount") do
    it("return amount of the expense") do
      test_expense = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-25" })
      expect(test_expense.amount()).to eq(1.20)
    end
  end

  describe("#date") do
    it("return the date of the purchase") do
      test_expense = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-25" })
      expect(test_expense.date()).to eq("2015-01-25")
    end
  end

  describe("#save") do
    it("saves an expense into an array") do
      test_expense = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-25" })
      test_expense.save()
      expect(Expense.all()).to eq([test_expense])
    end
  end

  describe("#==") do
    it("identifies when two expenses are the same") do
      test_expense1 = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-25" })
      test_expense1.save()
      test_expense2 = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-25" })
      test_expense2.save()
      expect(test_expense1).to eq(test_expense2)
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Expense.all()).to eq([])
    end
  end
end
