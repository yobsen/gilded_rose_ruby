module Items
  class Sulfuras
    attr_reader :name, :sell_in, :quality

    def initialize(name, _sell_in = nil, _quality = nil)
      @name = name
      @sell_in = Float::INFINITY
      @quality = 80
    end

    def next_day
      self
    end
  end
end
