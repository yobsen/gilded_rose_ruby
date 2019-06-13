# frozen_string_literal: true

require_relative 'item'
Dir['items/*.rb'].each { |item| require_relative item }

class ItemFactory
  NAME_TO_CLASS_MAP = {
    'Aged Brie' => Items::AgedBrie,
    'Sulfuras, Hand of Ragnaros' => Items::Sulfuras,
    'Backstage passes to a TAFKAL80ETC concert' => Items::BackstagePass,
    'Conjured Mana Cake' => Items::Conjured
  }.freeze

  def initialize(item)
    @item = item
  end

  def cast
    item_class = NAME_TO_CLASS_MAP[@item.name] || Items::Regular
    item_class.new(@item.name, @item.sell_in, @item.quality)
  end
end
