require_relative 'lib/product.rb'
require_relative 'lib/supermarket.rb'
require 'pry'

DISCOUNT_RULES = { price_for_two_a: '180$',
  price_for_three_b: '120$',
  off_total_percentage: 10,
}.freeze

rule_1 = lambda do |products, total|
  a_products = products.select { |product| product.title == "a" }

  if a_products.size >= 2
    count_of_discount_bunches = a_products.size / 2
    discount_for_bunch = 2 * a_products.first.price - 180
    total - count_of_discount_bunches * discount_for_bunch
  else
    total
  end
end

rule_2 = lambda do |products, total|
  b_products = products.select { |product| product.title == "b" }

  if b_products.size >= 3
    count_of_discount_bunches = b_products.size / 3
    discount_for_bunch = 3 * b_products.first.price - 120
    total - count_of_discount_bunches * discount_for_bunch
  else
    total
  end
end

rule_3 = lambda do |_, total|
  if total > 500
    0.9 * total
  else
    total
  end
end

A = { title: 'a', price: 100 }
B = { title: 'b', price: 50 }
C = { title: 'c', price: 30 }

basket = Supermarket.new([rule_1, rule_2, rule_3])
p_1 = Product.new(A)
p_2 = Product.new(B)
p_3 = Product.new(C)

5.times { basket.add(p_1) }
5.times { basket.add(p_2) }
# 2.times { basket.add(p_3) }



puts "all are #{basket.all}"
puts "total is #{basket.total}"

