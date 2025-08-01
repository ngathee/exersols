class SpaceAge 
  PLANETS = {mercury: 0.2408467, venus: 0.61519726, earth: 1.0, mars: 1.8808158,
             jupiter: 11.862615, saturn: 29.447498, uranus: 84.016846, 
              neptune: 164.79132}.freeze 
  EARTH_YEARS_IN_SECONDS = 31_557_600 
  
  def initialize(age)
    @age = age
  end

  PLANETS.each do |planet, years| 
    define_method("on_#{planet.to_s}".to_sym) do 
      @age / (EARTH_YEARS_IN_SECONDS * years)
    end
  end
end
