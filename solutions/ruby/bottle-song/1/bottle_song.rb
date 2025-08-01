module BottleSong 
  module_function 
  def recite(start, count)
    count_in_words = %w(no one two three four five six seven eight nine ten)
    verse = ""
    last = start - count + 1
    start.downto(last) do |index|
      verse += "#{(count_in_words[index]).capitalize} green bottle#{index > 1 ? 's': ''} hanging on the wall,\n"
      verse += "#{(count_in_words[index]).capitalize} green bottle#{index > 1 ? 's': ''} hanging on the wall,\n"
      verse += "And if one green bottle should accidentally fall,\n"
      verse += "There'll be #{count_in_words[index - 1]} green bottle#{index - 1 == 1? '': 's'} hanging on the wall.\n\n"
    end
    verse.chop 
  end
end