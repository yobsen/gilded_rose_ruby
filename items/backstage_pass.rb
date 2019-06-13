# frozen_string_literal: true

require_relative 'degradable'

module Items
  class BackstagePass
    include Degradable

    private

    def new_quality
      if @sell_in > 10 then @quality + 1
      elsif @sell_in <= 0 then 0
      elsif @sell_in <= 5 then @quality + 3
      elsif @sell_in <= 10 then @quality + 2
      end
    end
  end
end
