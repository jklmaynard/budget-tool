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

  describe(".all") do
    it("is empty at first") do
      expect(Category.all()).to eq([])
    end
  end
end
