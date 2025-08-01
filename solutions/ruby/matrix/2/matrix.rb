class Matrix
  def initialize(matrix_string)
    @rows = matrix_string.split("\n").map{|element| element.split(" ").map(&:to_i)}
  end

  def row(index)
    @rows[index - 1]
  end

  def column(index) 
    @rows.map {|row| row[index - 1]}
  end
end