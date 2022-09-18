class Product
  def initialize(productname)
    @product = productname
    puts "instance of product created"
  end

  def price
    @product[:price]
  end

  def title
    @product[:title]
  end
end
