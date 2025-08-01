module TwelveDays 
  def self.song 
    song_string = ""
    verse = []
    day_gifts = {
      "first" => "a Partridge in a Pear Tree", 
      "second" => "two Turtle Doves", 
      "third" =>"three French Hens",
      "fourth" => "four Calling Birds", 
      "fifth" => "five Gold Rings", 
      "sixth" => "six Geese-a-Laying", 
      "seventh" => "seven Swans-a-Swimming",
      "eighth" => "eight Maids-a-Milking",
      "ninth" => "nine Ladies Dancing",
      "tenth" => "ten Lords-a-Leaping",
      "eleventh" => "eleven Pipers Piping",
      "twelfth" => "twelve Drummers Drumming"
      }.freeze 

    day_gifts.each do |day, gift| 
      verse.unshift(day_gifts[day])
      if verse.length <= 2
        verse_string = verse.join(", and ")
      else 
        last = verse.last
        verse_string = verse[0..-2].join(", ") + ", and " + last 
      end
      song_string += "On the #{day} day of Christmas my true love gave to me: #{verse_string}.\n\n"
    end
    song_string.delete_suffix("\n")
  end
end