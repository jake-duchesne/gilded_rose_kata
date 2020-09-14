def update_quality(items)
  items.each do |item|
    update_item_quality(item)
    increase_backstage_quality(item)
    item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
    update_item_quality(item) if item.sell_in < 0
  end
end
def increase_quality(item)
  item.quality += 1 if item.quality < 50
end
def decrease_quality(item)
  item.quality -= 1 if item.quality > 0 && item.name !='Sulfuras, Hand of Ragnaros' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
  item.quality = 0 if item.name == 'Backstage passes to a TAFKAL80ETC concert' && item.sell_in < 0
end
def increase_backstage_quality(item)
  return unless item.name == 'Backstage passes to a TAFKAL80ETC concert'
  increase_quality(item)
  increase_quality(item) if item.sell_in < 11
  increase_quality(item) if item.sell_in < 6
end
def update_item_quality(item)
  if item.name == 'Aged Brie'
    increase_quality(item)
  else
    decrease_quality(item)
  end
end
#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------
Item = Struct.new(:name, :sell_in, :quality)
