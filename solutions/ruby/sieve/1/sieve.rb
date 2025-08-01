class Sieve 
  attr_reader :primes 
  
  def initialize(target)
    candidates = (2..target).to_a 
    @primes = candidates.each_with_index do |candidate, i|
      next if candidate.zero? 
      (i + 1).upto(candidates.length - 1) do |j|
        next if candidates[j] == 0 
        candidates[j] = 0 if candidates[j] % candidate == 0 
      end 
    end.select {|candidate| !candidate.zero? }
  end 
end 