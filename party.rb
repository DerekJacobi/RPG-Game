class Party
  def initialize
    @alive = []
    @dead = []
  end

  def enroll(member)
    @alive << member
  end

  def any?
    @alive.any?
    # should return true if the party has surviving members
  end

  def none?
    !any?
  end
end

class HeroParty < Party
  def attack(opposing_party)
    # sending message to user, asking which monster to attack
    puts "What Goblin do you want to attack? Press 0 for #{opposing_party[0].name} , press 1 for #{opposing_party[1].name}, press 2 for #{opposing_party[2].name}"
    goblin = gets.chomp
    hero.attack(opposing_party[goblin])
  end
end

class MonsterParty < Party
  def attack(opposing_party)
    # randomly choose a member of the opposing_party and attack it
  end
end
