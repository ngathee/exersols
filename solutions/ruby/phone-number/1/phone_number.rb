module PhoneNumber 
  def self.clean(number)
    number = number.scan(/\d+/).join 
    size = number.size 
    return nil if size < 10 || size > 11 
    return nil if size == 11 && number[0] != "1"
    number = number[1..-1] if size == 11 
    return nil if number[0].to_i < 2  || number[3].to_i < 2 

    number
  end 
end 