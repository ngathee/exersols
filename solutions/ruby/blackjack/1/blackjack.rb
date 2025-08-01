module Blackjack
  def self.parse_card(card)
    case card 
    when "ace" then 11
    when "two" then 2
    when "three" then 3 
    when "four" then 4 
    when "five" then 5 
    when "six" then 6 
    when "seven" then 7 
    when "eight" then 8
    when "nine" then 9
    when "ten", "jack", "queen", "king" then 10 
    else 0
    end 
  end

  def self.card_range(card1, card2)
    score = parse_card(card1) + parse_card(card2) 
    case score 
    when (4..11) then "low"
    when (12..16) then "mid"
    when (17..20) then "high"
    when 21 then "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    parsed_card1 = parse_card(card1)
    parsed_card2 = parse_card(card2)
    parsed_dealer_card = parse_card(dealer_card)
    blackjack = (parsed_card1 + parsed_card2) == 21  

    case 
    when parsed_card1 == parsed_card2 && parsed_card1 == 11 then 'P'
    when blackjack && !((10..11) === parsed_dealer_card) then 'W'
    when blackjack && (10..11) === parsed_dealer_card then 'S'
    when card_range(card1, card2) == "high" then 'S'
    when card_range(card1, card2) == "mid" && parsed_dealer_card < 7 then 'S'
    when card_range(card1, card2) == "mid" && parsed_dealer_card >= 7 then 'H'
    when (parsed_card1 + parsed_card2) <= 11 then 'H'
    end 
  end
end
