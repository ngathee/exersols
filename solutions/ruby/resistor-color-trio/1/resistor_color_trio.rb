class ResistorColorTrio 
  COLOR_VALUES = %w[black brown red orange yellow green blue violet grey white].freeze 
  
  def initialize(color_bands)
    @color_bands = color_bands 
  end 

  def label 
    first, second, third = @color_bands 
    value = [COLOR_VALUES.index(first), COLOR_VALUES.index(second)].join.to_i
    multiplier = 10 ** COLOR_VALUES.index(third)
    value *=  multiplier  
    label = "Resistor value: #{value >= 1000 ? value/1000 : value } " 
    label += value >= 1000 ? "kiloohms" : "ohms"
  end
end 