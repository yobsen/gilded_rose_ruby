# frozen_string_literal: true

require_relative 'degradable'

module Items
  class AgedBrie
    include Degradable

    private

    def new_quality
      @quality + 1
    end
  end
end
