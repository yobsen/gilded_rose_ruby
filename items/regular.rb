# frozen_string_literal: true

require_relative 'degradable'

module Items
  class Regular
    include Degradable

    private

    def new_quality
      @sell_in.positive? ? @quality - 1 : @quality - 2
    end
  end
end
