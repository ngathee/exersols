module ParallelLetterFrequency 
  class << self 
    
    def count(texts)
      job_count = texts.size 
      GC.start 
      results = Ractor.new do 
        loop do 
          Ractor.yield Ractor.receive 
        end 
      end 

      texts.map do |text| 
        Ractor.new(results, text) do |results, text|
          tally = Hash.new(0)
          text.downcase.gsub(/[^\p{Alpha}]/, '').each_grapheme_cluster do |cluster|
            tally[cluster] += 1
          end
          results.send(tally)
        end
      end 

      frequencies = Hash.new(0)
      job_count.times do 
        job = results.take 
        job.each do |cluster, count|
          frequencies[cluster] += count 
        end
      end
      
      frequencies 
    end
  end
end