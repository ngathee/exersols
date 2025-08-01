module EliudsEggs
  def self.egg_count(number)
    number.to_s(2).chars.map(&:to_i).sum 
  end
end