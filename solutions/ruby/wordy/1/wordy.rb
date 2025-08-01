class WordProblem 
  def initialize(problem) 
    @problem = problem 
  end 

  def answer
    raise ArgumentError.new("Not a math problem") unless @problem.start_with?("What is") 
    problem = @problem.delete_prefix("What is ").delete("by").delete("?").split(" ")
    raise ArgumentError.new("Operation not supported") unless problem.size >= 3 
    exp = problem.map do |e| 
            case e 
            when "plus" then '+'
            when 'minus' then '-'
            when 'multiplied' then '*'
            when 'divided' then '/'
            else e.to_i 
            end
        end
    exp.size <= 3 ? exp[0].send(exp[1], exp[2]) : (exp[0].send(exp[1], exp[2])).send(exp[3], exp[4])
  end
end 