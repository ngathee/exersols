module Grid 
  def self.saddle_points(input)
    results = []

    unless input.flatten.empty? 
      input.each_with_index do |row, index|  
        row_max = row.max 
        columns = input.transpose 
        columns.each_with_index do |column, column_index| 
          results << {"row" => index + 1, "column" => column_index + 1 } if column.min == row_max 
        end 
      end 
    end 
    results 
  end
end 
