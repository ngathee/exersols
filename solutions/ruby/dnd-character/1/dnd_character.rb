=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
  INITIAL_HITPOINTS = 10 
  
  def self.modifier(constitution)
    (constitution - 10)/ 2
  end

  def initialize
    @strength = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
    @dexterity = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
    @constitution = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
    @intelligence = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
    @wisdom = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
    @charisma = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
  end

  def hitpoints 
    INITIAL_HITPOINTS + DndCharacter.modifier(@constitution)
  end
end
