module Hamming 
  def self.compute(strand1, strand2)
    raise ArgumentError if (strand1.size < strand2.size || strand2.size < strand1.size)
    difference = 0 
    strand1 = strand1.chars
    strand2 = strand2.chars
    index = 0
    while index < strand1.length 
      strand1[index] != strand2[index] ? difference += 1 : difference
      index += 1
    end
    difference
  end
end
