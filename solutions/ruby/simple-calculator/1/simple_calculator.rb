class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError; end 

  def self.calculate(first_operand, second_operand, operation)
    begin 
      if ALLOWED_OPERATIONS.include?(operation)
        if first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
          case operation 
          when '+'  
            "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"          
          when '/'  
            "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
          when '*'
            "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
          end
        else 
          raise ArgumentError 
        end
      else 
        raise UnsupportedOperation
      end
    rescue ZeroDivisionError => e 
      "Division by zero is not allowed."
    end
  end
end
