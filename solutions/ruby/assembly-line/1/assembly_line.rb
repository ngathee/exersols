class AssemblyLine
  CARS_PRODUCED_PER_HOUR = 221 
  
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed >= 1 && @speed <= 4
      success_rate = 1.0
    elsif @speed >= 5 && @speed <= 8
      success_rate = 0.9
    elsif @speed == 9
      success_rate = 0.8
    elsif @speed == 10
      success_rate = 0.77 
    end

    @speed * CARS_PRODUCED_PER_HOUR * success_rate 
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
