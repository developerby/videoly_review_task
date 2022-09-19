module DiscountUtils
  extend self

  def bunch(bunch_size, scope, bunch_price, total)
    if scope.size >= bunch_size
      discount_for_bunch = bunch_size * scope.first.price - bunch_price
      count_of_bunches = scope.size / bunch_size
      total - count_of_bunches * discount_for_bunch
    else
      total
    end
  end
end
