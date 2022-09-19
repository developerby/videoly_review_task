# frozen_string_literal: true

require_relative 'lib/product'
require_relative 'lib/supermarket'
require_relative 'discount_utils'
# require 'pry'

# DISCOUNT_RULES = {
#   price_for_two_a: 180,
#   price_for_three_b: 120,
#   off_total_percentage: 10,
# }.freeze

# A_BUNCH = {
#   title: 'a', size: 2, price: 180
# }.freeze
# B_BUNCH = {
#   title: 'b', size: 3, price: 120
# }.freeze

A = { title: 'a', price: 100 }
B = { title: 'b', price: 50 }
C = { title: 'c', price: 30 }

RULE_1 = lambda do |products, total|
  a_products = products.select { |product| product.title == 'a' }
  DiscountUtils.bunch(2, a_products, 180, total)
end.freeze

RULE_2 = lambda do |products, total|
  b_products = products.select { |product| product.title == 'b' }
  DiscountUtils.bunch(3, b_products, 120, total)
end.freeze

RULE_3 = lambda do |_, total|
  return total if total <= 500
  total * 0.9
end.freeze

basket = Supermarket.new([RULE_1, RULE_2, RULE_3])
p_1 = Product.new(A)
p_2 = Product.new(B)
p_3 = Product.new(C)

5.times { basket.add(p_1) }
5.times { basket.add(p_2) }
2.times { basket.add(p_3) }

puts "all are #{basket.inspect}"
puts "total is #{basket.total}"

