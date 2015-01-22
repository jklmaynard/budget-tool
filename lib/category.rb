class Category
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_method(:save) do
    DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
    # @id = results.first().fetch("id").to_i
  end

  define_method(:==) do |another_category|
    self.name() == another_category.name()
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM category;")
    categories = []
    results.each do |result|
      name = result.fetch("name")
      categories.push(Category.new({ :name => name }))
    end
    categories
  end

end
