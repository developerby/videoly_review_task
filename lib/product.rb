class Product
  def initialize(params)
    @product = params
  end

  def price
    @product[:price]
  end

  def title
    @product[:title]
  end
end
