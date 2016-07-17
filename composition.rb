# Composition Example
# Purpose is to create Objects with relations one-to-many
# In this Example:
# => Human have many artifacts.
# => Artifact has name and description.
# => Human can tell what artifacts his have.

class Human
  attr_reader :health

  def initialize(args={})
    @name = args.fetch(:name,'John Snow')
    @health = args.fetch(:health, 100)
    @artifacts = args[:artifacts]
  end

  def description
    p @artifacts.artifacts_description
  end
end

class Artifact
  attr_reader :name, :description

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
  end
end

class Artifacts
  def initialize(artifacts)
    @artifacts = artifacts
  end

  def artifacts_description
    desc = 'This guy have '
    @artifacts.each_with_index do |artifact, i|
      if i == 0
        desc << artifact.name
      else
        desc << (i != @artifacts.size - 1 ?  ', ' : ' and ') << artifact.name
      end
    end
    desc + '.'
  end
end

sword = Artifact.new(name: 'sword', description: 'Classic weapon for hero')
helm = Artifact.new(name: 'helm', description: 'Basic defense for head')
chains_mail = Artifact.new(name: 'chain mail', description: 'Light defense for body. Dont reduce movement')

warrior =
  Human.new(
    health: 180,
    artifacts: Artifacts.new([sword,
                              helm,
                              chains_mail]))

warrior.description
