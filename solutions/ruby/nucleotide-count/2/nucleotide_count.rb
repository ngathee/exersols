module  Nucleotide 
  def self.from_dna(sequence) 
    @sequence = sequence.upcase
    raise ArgumentError unless sequence.empty? || /^[ATGC]/ =~ sequence
    self 
  end 

  def self.histogram 
    hist = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    @sequence.each_char{|char| hist[char] += 1 }
    hist
  end 

  def self.count(n) 
    @sequence.count(n) 
  end 
end 