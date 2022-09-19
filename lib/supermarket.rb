class Supermarket
  def initialize(discount_rules)
    @discount_rules = discount_rules
    @products = []
  end

  def add(product)
    @products << product
  end

  def inspect
    @products.map do |product|
      { "#{product.title}" => product.price }
    end
  end

  def total
    total = @products.reduce(0) { |acc, product| acc + product.price }
    @discount_rules.each do |rule|
      total = rule.call(@products, total)
    end
    total
  end
end
