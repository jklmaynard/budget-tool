require('spec_buddy')

describe(Category) do
  describe("#name") do
    it("returns name of the catagory") do
      test_category = Category.new({ :name => "Food" })
      expect(test_category.name()).to eq("Food")
    end
  end

  describe("#save") do
    it("saves a category into an array") do
      test_category = Category.new({ :name => "Food" })
      test_category.save()
      expect(Category.all()).to eq([test_category])
    end
  end

  describe("#==") do
    it("identifies when two categories are the same") do
      category1 = Category.new({ :name => "Food" })
      category1.save()
      category2 = Category.new({ :name => "Food" })
      category2.save()
      expect(category1).to eq(category2)
    end
  end

  describe("#id") do
    it("returns the id from the category table") do
      test_category1 = Category.new({ :name => "Food" })
      test_category1.save()
      test_category2 = Category.new({ :name => "Clothes" })
      test_category2.save()
      expect(test_category1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#add_expense") do
    it("add an expense to a category 'puts info into join table'") do
      test_category = Category.new({ :name => "Food" })
      test_category.save()
      test_expense = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-27" })
      test_category.add_expense(test_expense)
      expect(Category.expenses()).to eq([test_expense])
    end
  end

  describe(".expenses") do
    it("returns the selected information from the database 'gets info from join table'") do
      test_category = Category.new({ :name => "Food" })
      test_category.save()
      test_expense = Expense.new({ :name => "candy bar", :amount => 1.20, :date => "2015-01-27" })
      test_category.add_expense(test_expense)
      expect(Category.expenses()).to eq("Food", "candy bar", 1.20, "2015-01-27")
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Category.all()).to eq([])
    end
  end
end
