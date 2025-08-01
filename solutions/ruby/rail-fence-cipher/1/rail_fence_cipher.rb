module RailFenceCipher 
  class << self 
    def encode(text, rails)
      return text if rails == 1 || text.empty? || text.length < rails 
      string = text.gsub(/\s+/, '')
      matrix = zigzag_matrix(string, rails)
      matrix.join.gsub(/[\*]/, '') 
    end 

    def decode(text, rails) 
      return text if rails == 1 || text.empty? || text.length < rails 
      
      length = text.size 
      matrix = zigzag_matrix(text, rails, false)

      pos = 0 
      (0...rails).each do |row|
        (0...length).each do |col|
          if matrix[row][col] == '+' 
            matrix[row][col] = text[pos] 
            pos += 1
          end
        end
      end
      
      decoded = ""
      row = 0 
      down = true 
      (0...length).each do |col|
        decoded  += matrix[row][col]
        down = false if row == rails - 1
        down = true if row == 0
        down ? row += 1 : row -= 1
      end

      decoded 
    end 

    def zigzag_matrix(text, depth, enc = true )
      size = text.size
      matrix = [] 
      depth.times { matrix << Array.new(size, "*") }
      
      row = 0 
      down = true 
      (0...size).each do |col|
        enc ? matrix[row][col] = text[col] : matrix[row][col] = '+'
        down = false if row == depth - 1 
        down = true if row == 0 
        down ? row += 1 : row -= 1 
      end 
      matrix 
    end 
    
  end 
end  