class Allergies 
  ALLERGENS = {
    128 => "cats",
    64 => "pollen",
    32 => "chocolate", 
    16 => "tomatoes", 
    8 => "strawberries",
    4 => "shellfish", 
    2 => "peanuts", 
    1 => "eggs"
  }.freeze 
  
  def initialize(score)
    @score = score 
  end 

  def allergic_to?(allergen)
    list.include?(allergen)
  end 

  def list
    ALLERGENS.map do |score, allergy|
      allergic, @score = @score.divmod(score)
      allergy if allergic % 2 == 1 
    end.compact.reverse 
  end 
end 