class Garden
  students = ["alice", "bob", "charlie", "david", 
    "eve", "fred", "ginny", "harriet", 
    "ileana", "joseph", "kincaid", "larry"].freeze
  plants = {"G" => :grass, "C" => :clover, "R" => :radishes, "V" => :violets}.freeze 
  
  def initialize(diagram)
    @row1, @row2 = diagram.split("\n").map{|row| row.chars.each_slice(2).to_a }
  end 

  students.each_with_index do |student, index|
    define_method(student) do 
      (@row1[index] + @row2[index]).map {|char| plants[char] }
    end 
  end 
end 