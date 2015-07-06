require 'colored'
require 'pry'

require_relative 'hero'
require_relative 'monster'
require_relative 'party'

class Game

  HEROS = [
  lancelot = Hero.new({
    name: "Lancelot",
    hp: 20,
    weapon: Weapon.new({
      name: "longbow",
      damage: 6,
      price: 25
    })
  }),
  link = Hero.new({
    name: "Link",
    hp: 20,
    weapon: Weapon.new({
      name: "Bow",
      damage: 6,
      price: 25
    })
  }),
  luke_skywalker = Hero.new({
    name: "Luke Skywalker",
    hp: 20,
    weapon: Weapon.new({
      name: "LightSaber",
      damage: 6,
      price: 25
    })
  }),
  tony_stark = Hero.new({
    name: "Tony Stark",
    hp: 20,
    weapon: Weapon.new({
      name: "Mark V Suit",
      damage: 6,
      price: 25
    })
  }),
  antman = Hero.new({
    name: "Antman",
    hp: 20,
    weapon: Weapon.new({
      name: "Ants",
      damage: 6,
      price: 25
    })
  }),
  micheal_jordan = Hero.new({
    name: "Michael Jordan",
    hp: 20,
    weapon: Weapon.new({
      name: "basketballs",
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
    @chosen_heroes = []
    @fighter = ''
  end

  def enlist_heroes
    @chosen_heroes = []
    puts "Which hero would you like to choose? (Choose two, select one hero at a time, by number)".blue
    2.times do
    HEROS.each_with_index {|val, index| puts "#{val.name} press #{index}".red}
    # Display choices for heroes
    # Prompt (gets) the user for choices e.g. 2, 6
    print "\nChoose Hero #{@chosen_heroes.length + 1}\n > "
    choice = gets.chomp.to_i
    @chosen_heroes << HEROS[choice]
    HEROS.delete_at(choice)
    # Create a party with those heroes in it and return it
    end
    puts "The Game has begun!"
    puts "Your heroes are: "
    @chosen_heroes.each {|hero| puts hero.name.green}
    path
  end

  def path
    puts "\nEnter 1 to go to The Forest or 2 to go to The Shop"
    destination = gets.chomp.to_i
    if destination == 1
      enter_forest
    elsif destination == 2
      enter_shop
    else
      puts "Invalid Selection, Please choose 1 or 2"
      path
    end
  end

  def enter_forest
    puts "You've encountered a group of Monsters who would like to do battle."
    battle
  end

  def battle
    if MONSTERS.any?
      puts "Which hero would you like to fight for you?"
      puts "There are #{MONSTERS.length} monster(s) remaining"
      @chosen_heroes.each_with_index {|val, index| puts "To choose: " + "#{val}".green + ", press #{index}. " + "(#{val.current_hp} HP Remaining)" }
      @fighter = @chosen_heroes[gets.chomp.to_i]
      fight
    else
      puts "There are currently no more monsters in these woods, please come back later"
      path
    end
  end

  def enter_shop
    puts "Welcome to the shop!, What can we help you find today?"
    puts "|+++++++++++++| |+++++++++++++|"
    puts "|[Weapons](1) | | [Armor](2)  |"
    puts "|+++++++++++++| |+++++++++++++|"
    shop_choice = gets.chomp.to_i
    case shop_choice
      when 1
      weapons_shop
      when 2
      armor_shop
    end
    path
  end

  def weapons_shop
    puts "Weapons Selection".blue
  end

  def armor_shop
  end

  def fight
    monster_fighter = MONSTERS.pop
    current_fighters = [@fighter, monster_fighter]
    attacker = current_fighters.shift
    attackee = current_fighters.shift
    while attackee.is_alive?
      attacker.attack(attackee)
      puts "#{attacker} attacks #{attackee} with his #{attacker.weapon} for #{attacker.weapon.damage}.  #{attackee} now has #{attackee.current_hp} HP left."
      attacker, attackee = attackee, attacker unless attackee.is_dead?
    end
    puts "#{attackee} is now dead..."
    battle if MONSTERS.any?
    path if MONSTERS.none?
  end
end

Game.new

binding.pry
