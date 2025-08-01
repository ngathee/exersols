class Integer 
  def to_roman 
    roman = ''
    thousands, hundreds, tens, ones = self.to_s.rjust(4).chars.map(&:to_i)
    roman += 'M' * thousands
    roman += 'CM' if hundreds == 9 
    roman += 'D' + 'C' * (hundreds - 5)  if hundreds >  5 and hundreds < 9 
    roman += 'D' if hundreds == 5 
    roman += 'CD' if hundreds == 4 
    roman += 'C' * hundreds if hundreds < 4 
    roman += 'XC' if tens == 9 
    roman += 'L' + 'X' * (tens - 5) if tens < 9 and tens > 5 
    roman += 'L' if tens == 5 
    roman += 'XL' if tens == 4 
    roman += 'X' * tens if tens < 4 
    roman += 'IX' if ones == 9 
    roman += 'V' + 'I' * (ones - 5) if ones < 9 and ones > 5 
    roman += 'V' if ones == 5 
    roman += 'IV' if ones == 4 
    roman += 'I' * ones if ones < 4 
    roman
  end 
end 