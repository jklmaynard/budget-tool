class Category
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_category|
    self.name() == another_category.name()
  end

  define_method(:add_expense) do |expense|
    results = DB.exec("INSERT INTO category_expenses (category_id, expenses_id) VALUES ('#{self.id().to_i()}', '#{expense.id().to_i()}') RETURNING id;")
  end

  define_singleton_method(:expenses) do
    results = DB.exec("SELECT expenses.* FROM category JOIN category_expenses ON (category.id = category_expenses.category.id) JOIN expenses ON (category_expenses.expenses.id = expenses.id) WHERE category.id = #{self.id()} ")
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM category;")
    categories = []
    results.each do |result|
      name = result.fetch("name")
      id = result.fetch("id").to_i()
      categories.push(Category.new({ :name => name, :id => id }))
    end
    categories
  end

end
