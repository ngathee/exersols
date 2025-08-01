=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints
  INITIAL_HITPOINTS = 10 
  
  def self.modifier(constitution)
    (constitution - 10)/ 2
  end

  def initialize
    @strength = ability 
    @dexterity = ability
    @constitution = ability 
    @intelligence = ability
    @wisdom = ability 
    @charisma = ability 
    @hitpoints = INITIAL_HITPOINTS + DndCharacter.modifier(@constitution)
  end
  
  def ability = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].max(3).sum 
end
