# frozen_string_literal: true

require_relative 'degradable'

module Items
  class Conjured
    include Degradable

    private

    def new_quality
      @sell_in.positive? ? @quality - 2 : @quality - 4
    end
  end
end
