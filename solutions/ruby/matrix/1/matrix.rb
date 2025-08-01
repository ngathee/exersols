class Matrix
  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map{|element| element.split(" ").map{|element| element.to_i }}
  end

  def row(index)
    @rows[index - 1]
  end

  def column(index) 
    columns = []
    @rows.each {|row| columns << row[index - 1]}
    columns
  end
end