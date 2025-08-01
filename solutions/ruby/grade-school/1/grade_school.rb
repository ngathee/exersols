class School 
  def initialize 
    @roster = {}
  end 

  def add(name, grade )   
    return false if @roster.values.flatten.include?(name)
    @roster[grade] ? @roster[grade] << name : @roster[grade] = [name]
    true 
  end 

  def grade(g) 
    (@roster[g].sort if @roster[g]) || []
  end
  
  def roster  
    @roster.sort.map {|_, v| v.sort }.flatten 
  end 
end 