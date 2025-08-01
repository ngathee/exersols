class Allergies 
  ALLERGENS = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats).freeze 
  
  def initialize(score)
    @score = score 
  end 

  def allergic_to?(allergen)
    list.include?(allergen)
  end 

  def list
    ALLERGENS.filter.with_index do |allergen, index|
      allergen if @score & (1 << index) != 0
    end
  end 
end 