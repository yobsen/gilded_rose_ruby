# frozen_string_literal: true

require_relative 'item_factory'

class GildedRose
  attr_reader :specified_items

  def initialize(items)
    @items = items
    @specified_items = items.map { |item| ItemFactory.new(item).cast }
  end

  def update_quality
    @specified_items.map!(&:next_day)
  end
end
