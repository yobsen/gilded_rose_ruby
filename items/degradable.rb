# frozen_string_literal: true

ItemError = Class.new(StandardError)

module Degradable
  MIN_QUALITY = 0
  MAX_QUALITY = 50

  attr_reader :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality

    raise ItemError, "Quality is out of range [#{@name}]" unless quality_in_range?
  end

  def next_day
    update_quality
    update_sell_in
    self
  end

  private

  def min_quality
    self.class::MIN_QUALITY
  end

  def max_quality
    self.class::MAX_QUALITY
  end

  def update_quality
    @quality = cap_quality(new_quality)
  end

  def cap_quality(quality)
    return max_quality if quality > max_quality
    return min_quality if quality < min_quality

    quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def maximum_quality?
    @quality >= max_quality
  end

  def minimum_quality?
    @quality <= min_quality
  end

  def quality_in_range?
    @quality.between?(min_quality, max_quality)
  end
end
