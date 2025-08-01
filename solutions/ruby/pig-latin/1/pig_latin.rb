module PigLatin 
  def self.translate(text) 
    text.split(" ").map do |word| 
      case 
      when word.start_with?(/[aeiou]|xr|yt/) 
        word = word + "ay"
      when word.start_with?(/[bcdfghjklmnpqrstvwxyz]?qu/)
        prefix = word.match(/[bcdfghjklmnpqrstvwxyz]?qu/).to_s 
        word = word.delete_prefix(prefix) + prefix + "ay"
      when word.start_with?(/[bcdfghjklmnpqrstvwxyz]+y/)
        prefix = word.match(/[bcdfghjklmnpqrstvwxyz]+y/).to_s.chop
        debug "Prefix: #{prefix}"
        word = word.delete_prefix(prefix) + prefix + "ay"
      else 
        prefix = word.match(/[bcdfghjklmnpqrstvwxyz]+/).to_s
        word = word.delete_prefix(prefix) + prefix + "ay"
      end 
      word
    end.join(" ")
  end 
end 