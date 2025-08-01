module ETL 
  def self.transform(old) 
    transformation = {} 
    old.each do |key, values| 
      values.each {|value| transformation[value.downcase] = key }
    end 
    transformation 
  end 
end 
