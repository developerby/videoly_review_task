# frozen_string_literal: true

class Supermarket
  def initialize(discount_rules)
    @discount_rules = discount_rules
    @products = []
  end

  def add(product)
    @products << product
  end

  def inspect
    @products.map { |product| {"#{product.title}" => product.price} }
  end

  def total
    total = @products.reduce(0) { |acc, p| acc + p.price }
    @discount_rules.each do |rule|
      total = rule.call(@products, total)
    end
    total
  end
end
