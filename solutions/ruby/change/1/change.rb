module Change
  class NegativeTargetError < StandardError; end 
  class ImpossibleCombinationError < StandardError; end 
  
  module_function 
  def generate(coin_units, amount)
    raise NegativeTargetError.new("No change for your debt") if amount < 0; 
    
    memo = Array.new(amount + 1, Float::INFINITY)
    memo[0] = 0 

    (1..amount).each do |i| 
      coin_units.each do |coin_unit|
        if coin_unit <= i 
          memo[i] = [memo[i], memo[i - coin_unit] + 1].min
        end 
      end
    end
    
    raise ImpossibleCombinationError.new("I don't have coins for your exact change. Sorry!") if memo[amount] == Float::INFINITY 
    
    change = [] 
    remainder = amount 
    while remainder > 0 
      coin_units.each do |coin_unit|
        if coin_unit <= remainder && memo[remainder - coin_unit] + 1 == memo[remainder] 
          change << coin_unit 
          remainder -= coin_unit 
          break 
        end
      end
    end 

    change 
  end
end 