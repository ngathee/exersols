module Gigasecond 
  GIGA = 1_000_000_000

  def self.from(time)
    time + GIGA
  end
end
