module PhoneNumber 
  def self.clean(number)
    number = number.gsub(/\D/, "").match(/\A1?[2-9]\d{2}[2-9]\d{2}\d{4}\z/)
    $&.nil? ? nil : $&.sub(/^1/, '')
  end 
end 