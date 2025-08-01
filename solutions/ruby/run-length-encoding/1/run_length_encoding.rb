module RunLengthEncoding 
  module_function 
  def encode(string)
    return string if string.empty?
    encoded = ""
    count = 1 
    last_char = string[0]
    string.chars.each_with_index do |char, index| 
      next if index == 0 
      if char == last_char 
        count += 1
      else 
        encoded += (count > 1 ? count.to_s + last_char : last_char)
        count = 1
        last_char = char 
      end
    end 
    encoded += (count > 1 ? count.to_s + last_char: last_char )
  end

  def decode(string)
    decoded = ""
    until string.empty?
      matched = string.match(/(\d+)?([a-zA-Z ])/)
      decoded += ($1? $2 * $1.to_i : $2) 
      string.delete_prefix!(matched.to_s)
    end 
    decoded 
  end 
end 