class Affine
  LETTERS = ('a'..'z').to_a 
  
  def initialize(a, b) 
    raise ArgumentError unless co_primes?(a)
    @a, @b = a, b
  end 

  def encode(text)
    text.downcase.gsub(/[\s\W]+/,"").chars.map do |char|
      char.match?(/[a-z]/) ?  LETTERS[((@a * LETTERS.index(char)) + @b) % LETTERS.size] : char
    end.each_slice(5).to_a.map(&:join).join(" ") 
  end 

  def decode(text) 
    text.gsub(/\s+/, '').each_char.map do |char|
      char.match?(/[a-z]/) ? LETTERS[((mmi(@a)) * (LETTERS.index(char) -  @b)) % LETTERS.size] : char 
    end.join
  end 

  private 
  def co_primes?(a)
    a.gcd(26) == 1
  end 

  def mmi(a)
    m = 26
    return -1 if a.gcd(m) > 1 # Will not get here
    (1...m).each do |i| 
      return i if ((a % m) * (i % m)) %  m == 1 
    end
  end 

end 