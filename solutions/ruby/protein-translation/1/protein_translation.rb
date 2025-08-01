class InvalidCodonError < StandardError; end 

module Translation 
  CODON_AMINO_ACID = {
    "AUG" => "Methionine", "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine", "UCU" => "Serine", "UCC" => "Serine",
    "UCA" => "Serine", "UCG" => "Serine", "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine", "UGG" => "Tryptophan", "UAA" => "STOP",
    "UAG" => "STOP", "UGA" => "STOP"  
  }.freeze 
  
  def self.of_rna(strand) 
    codons = strand.chars.each_slice(3).map(&:join) 
    stop = codons.index("UAA") || codons.index("UAG") || codons.index("UGA")
    codons = codons[0...stop]
    debug "#{codons}"

    codons.each do |codon|
      raise InvalidCodonError unless CODON_AMINO_ACID.key?(codon)
    end 
    
    codons.map do |codon| 
      CODON_AMINO_ACID[codon] 
    end
  end 
end 