module BaseConverter 
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if invalid_inputs?(input_base, digits, output_base)
    decimal = to_decimal(input_base, digits)
    to_base(output_base, decimal)
  end

  private
  def self.to_decimal(input_base, digits) 
    digits.reverse.map.with_index {|digit, index| digit * input_base**index}.sum 
  end

  def self.to_base(base, decimal) 
    result = []
    q, r = decimal.divmod(base)
    result << r 
    while q > 0
      q, r = q.divmod(base)
      result << r 
    end
    result.reverse
  end

  def self.invalid_inputs?(input_base, digits, output_base)
    return true if input_base < 2 || output_base < 2 
    return true if input_base == 2 && digits.any? {|digit| digit < 0 || digit > 1 }
  end
end 
