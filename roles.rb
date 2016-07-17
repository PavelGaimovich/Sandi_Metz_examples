# Roles
# Example, how many objects can share one behaviour.
# In this example Damageble role is creating dependency for DamageCalculator class.
# To calculate damage heroes should have behaviour what they get from Damageble module.
module Damageble
  attr_writer :calculator

  def calculator
    @calculator ||= DamageCalculator.new
  end

  def make_damage_to(opponent)
    calculator.calc(self, opponent)
  end

  def damage
    sword_attack || fire_attack
  end

  def sword_attack
    nil
  end

  def fire_attack
    nil
  end
end

class Warrior
  include Damageble

  def sword_attack
    11
  end
end

class Magician
  include Damageble

  def fire_attack
    34
  end
end

class Thief
  include Damageble
  attr_accessor :life

  def initialize
    @life = 200
  end

  def sword_attack
    5
  end
end

class DamageCalculator
  def calc(human, enemy)
    enemy.life -= human.damage
  end
end

enemy = Thief.new
Warrior.new.make_damage_to enemy
p enemy.life
Magician.new.make_damage_to enemy
p enemy.life
