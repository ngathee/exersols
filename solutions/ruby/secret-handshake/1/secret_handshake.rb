class SecretHandshake
  def initialize(handshake)
    @handshake = handshake
  end

  def commands
    results = [] 
    return results unless @handshake.is_a?(Integer)
    {1 => "wink", 2 => "double blink", 4 => "close your eyes", 8 => "jump", 16 => true  }.map do |k, v| 
      results << v if k & @handshake == k 
    end 
    reversed = results.pop if results.last == true 
    reversed ? results.reverse : results  
  end
end
