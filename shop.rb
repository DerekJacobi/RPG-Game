require_relative 'weapon'
require_relative 'entity'

class Shop
  def initialize
  end

  def self.browse
    puts "BROWSING DAMMIT"
   item = gets.chomp

   if wealthy_enough?(party, item)
     party.gold -= item.price
     party.weapon += item
   else
     puts "You're poor, go away."
   end
 end
end
