# frozen_string_literal: true

class NormalItem
  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def tick
    update_quality
    reduce_sell_in
  end

  def update_quality
    return if @quality.zero?

    @quality -= 1 if @sell_in.positive?
    @quality -= 2 if @sell_in <= 0
  end

  def reduce_sell_in
    @sell_in -= 1
  end
  attr_reader :quality, :sell_in
end

class AgedBrieItem < NormalItem
  def update_quality
    @quality += 1 if sell_in.positive?
    @quality += 2 if sell_in <= 0
    @quality = 50 if @quality > 50
  end
end

class BackstagePassItem < NormalItem
  def update_quality
    @quality += 1 if sell_in > 10
    @quality += 2 if sell_in <= 10 && sell_in > 5
    @quality += 3 if sell_in <= 5 && sell_in.positive?
    @quality = 0 if sell_in <= 0
    @quality = 50 if @quality > 50
  end
end

class SulfurasItem < NormalItem
  def update_quality; end

  def reduce_sell_in; end
end

class ConjuredItem < NormalItem
  def update_quality
    return if @quality.zero?

    @quality -= 2 if @sell_in.positive?
    @quality -= 4 if @sell_in <= 0
  end
end
