# Singleton using
# Little example, how use singleton pattern for chat.
require 'singleton'

class Warrior
	def self.words
		['Hey!', 'Ho!', 'Wow']
	end
	def self.war_screams
		WarScreams.scream(self)
	end
end

class WarScreams
	include Singleton
	attr_accessor :screams_list

	def self.scream(human)
		human.words.each do |w|
			screams_list << w + ' eh...'
		end
		screams_list
	end

	private

	def self.screams_list
		@screams_list ||= []
	end
end

p Warrior.war_screams
WarScreams.screams_list << 'Screams will never end'
p Warrior.war_screams
WarScreams.screams_list << 'Dungeon is not so funny now'
p WarScreams.screams_list
