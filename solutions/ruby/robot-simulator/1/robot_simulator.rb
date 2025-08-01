class Robot 
  COMPASS = [:west, :north, :east, :south].freeze 
  
  def initialize 
    @coordinates = [] 
    @orientation = nil 
  end 

  def at(x, y)
    @coordinates = x, y 
  end 
  
  def orient(direction) 
    raise ArgumentError.new "Bad orientation" unless COMPASS.include?(direction)
    @orientation = COMPASS.index(direction)
  end 

  def bearing 
    COMPASS[@orientation] 
  end 

  def coordinates 
    @coordinates  
  end 

  def turn_right
    @orientation = (@orientation + 1) % 4 
  end 

  def turn_left 
    @orientation = @orientation - 1  < 0 ? 3 : @orientation - 1 
  end 

  def advance 
    direction = COMPASS[@orientation]
    case direction 
    when :north then coordinates[1] += 1 
    when :south then coordinates[1] -= 1 
    when :east then coordinates[0] += 1 
    when :west then coordinates[0] -= 1
    end 
  end 
end 

class Simulator 
  def instructions(input) 
    input.chars.map do |char|
      case char 
      when 'L' then :turn_left 
      when 'R' then :turn_right
      when 'A' then :advance 
      end 
    end
  end 

  def place(robot, x:, y:, direction:)
    robot.at(x, y) 
    robot.orient(direction) 
  end 

  def evaluate(robot, input)
    instructions = instructions(input)

    instructions.each do |instruction| 
      robot.send(instruction)
    end 
  end 
end 










