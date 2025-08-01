class Clock
  attr_reader :time_in_minutes 
  
  def initialize(hour: 0, minute: 0)
    @time_in_minutes = hour * 60 + minute
  end

  def to_s 
    hours, minutes = time_in_minutes.divmod(60)
    hours %= 24 
    "#{hours < 10 ? "0" + hours.to_s : hours}:#{minutes < 10 ? "0" + minutes.to_s : minutes}"
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def +(other)
    @time_in_minutes += other.time_in_minutes 
    self 
  end

  def -(other) 
    @time_in_minutes -= other.time_in_minutes 
    self
  end
end