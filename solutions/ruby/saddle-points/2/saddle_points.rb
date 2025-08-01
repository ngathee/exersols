module Grid 
  def self.saddle_points(input)
    results = []
    input.each_with_index do |row, index|  
      columns = input.transpose 
      columns.each_with_index do |column, column_index| 
        results << {"row" => index + 1, "column" => column_index + 1 } if column.min == row.max
      end 
    end 
    results 
  end
end 
