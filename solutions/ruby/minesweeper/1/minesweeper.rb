class Minesweeper
  def self.annotate(input) 
    copy = input.map {|e| e.chars }

    copy.each_with_index do |row, r| 
      row.each_with_index do |col, c| 
        next if col == '*' 
        n = copy[r - 1][c] unless r - 1 < 0 
        s = copy[r + 1][c] unless r + 1 > copy.size - 1 
        e = copy[r][c + 1] unless c + 1 > row.size - 1
        w = copy[r][c - 1] unless c - 1 < 0 
        ne = copy[r - 1][c + 1] unless r - 1 < 0 || c + 1 > row.size - 1 
        se = copy[r + 1][c + 1] unless r + 1 > copy.size - 1 || c + 1 > row.size - 1 
        sw = copy[r + 1][c - 1] unless r + 1 > copy.size - 1 || c - 1 < 0 
        nw = copy[r - 1][c - 1] unless r - 1 < 0 || c - 1 < 0 

        count = 0 
        [n, s, e, w, ne, se, sw, nw].each {|d| count += 1 if d && d == '*'}
        copy[r][c] = count > 0 ? count : " " 
      end 
    end 

    copy.map {|row| row.join }
  end 
end
