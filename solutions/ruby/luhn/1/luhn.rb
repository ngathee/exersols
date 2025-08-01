module Luhn
  def self.valid?(string)
    string.gsub!(/\s+/, '')
    return false if (string.length <= 1)
    return false if (string.scan(/\D/).any?)

    numbers = string.reverse.chars.map.with_index do |char, index| 
      index.odd? ? (char.to_i * 2 > 9 ? char.to_i * 2 - 9 : char.to_i * 2 ) : char.to_i
    end

    numbers.inject(&:+) % 10 == 0 
  end
end