module A
  class << self
    def price
      100
    end

    def name
      :a
    end
  end
end

module B
  class << self
    def price
      50
    end

    def name
      :b
    end
  end
end

module C
  class << self
    def price
      30
    end

    def name
      :c
    end
  end
end

class Product
  def initialize(product)
    @product = product
  end

  attr_reader :product
end
