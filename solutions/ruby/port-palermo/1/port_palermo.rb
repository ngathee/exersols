module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE 

  def self.get_identifier(city)
    city[0,4].upcase.to_sym 
  end

  def self.get_terminal(ship_identifier)
    first_part = ship_identifier[0,3]
    return :A if first_part == "OIL" || first_part  == 'GAS'
    :B
  end
end
