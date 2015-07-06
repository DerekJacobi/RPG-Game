require 'colored'
require 'pry'

require_relative 'hero'
require_relative 'monster'
require_relative 'party'

class Game

  HEROS = [
  lancelot = Hero.new({
    name: "lancelot",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),
  link = Hero.new({
    name: "link",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),
  luke_skywalker = Hero.new({
    name: "Luke Skywalker",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),
  tony_stark = Hero.new({
    name: "Tony Stark",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),
  antman = Hero.new({
    name: "Antman",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),
  micheal_jordan = Hero.new({
    name: "Michael Jordan",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),

]

  MONSTERS = [
    goblin = Monster.new({
    name: "Goblin, father of 7",
    hp: 9,
    weapon: Weapon.new({
      name: "his wife's rusty last kitchen knife",
      damage: 1,
      price: 1
    }),
    xp: 2,
    gold: 1
  }),

  ghost = Monster.new({
    name: "Casper",
    hp: 6,
    weapon: Weapon.new({
      name: "his wife's rusty last kitchen knife",
      damage: 1,
      price: 1
    }),
    xp: 2,
    gold: 1
  }),

  shrek = Monster.new({
    name: "Ogre",
    hp: 11,
    weapon: Weapon.new({
      name: "onions",
      damage: 2,
      price: 1
    }),
    xp: 3,
    gold: 1
  }),

  ]


  def initialize
    @heroes = enlist_heroes
  end

  def enlist_heroes
    chosen_heros = []
    puts "Which hero would you like to choose? (Choose 3, select one hero at a time, by number)"
    until chosen_heros.length > 2
    HEROS.each_with_index {|val, index| puts "#{val.name} press #{index}"}
    # Display choices for heroes
    # Prompt (gets) the user for choices e.g. 2, 6
    print "Choose Hero #{chosen_heros.length + 1} > "
    choice = gets.chomp.to_i
    chosen_heros << HEROS[choice]
    HEROS.delete_at(choice)
    # Create a party with those heroes in it and return it
    end
    puts "The Game has begun!"
    chosen_heros
  end

  def enter_forest

  end

  def enter_shop

  end

  def town_message
    puts <<-PLAY_MESSAGE
    Your heroes are ready for action,
    should they...
    1. Enter the forest?
    2. Go shopping for wares?
    PLAY_MESSAGE
  end

  def get_location
    resp = gets.chomp

    if resp == "1"
      return :forest
    else
      return :shop
    end
  end

  def play
    town_message
    case get_location
    when :forest
      enter_forest
    when :shop
      enter_shop
    end
  end
end

Game.new



# current_fighters = [artemis, goblin]
# attacker = current_fighters.shift
# attackee = current_fighters.shift
#
# while attackee.is_alive?
#   attacker.attack(attackee)
#
#   puts "#{attacker} attacks #{attackee} with his #{attacker.weapon} for #{attacker.weapon.damage}.  #{attackee} now has #{attackee.current_hp} HP left."
#
#   attacker, attackee = attackee, attacker unless attackee.is_dead?
# end
#
# puts "#{attackee} is now dead..."


binding.pry
