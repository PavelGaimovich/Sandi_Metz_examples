# Composition Example
# Purpose is to create Objects with relations one-to-many
# This example is like previous, but here was using factory pattern
# and artifacts now described in array with configuration.
require "ostruct"

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

module ArtifactsFactory
  def self.build(config, artifacts_class = Artifacts)
    artifacts_class.new(
      config.collect { |artifact_config|
        create_artifact(artifact_config)})
  end

  private

  def self.create_artifact(artifact_config)
    OpenStruct.new(
      name: artifact_config[0],
      description: artifact_config[1]
    )
  end
end

magician_config =
  [['Stuff', 'Can do magic'],
   ['Robe', 'Grant some magic defense'],
   ['Wizard hat', 'Powerful artifact, what level up magic skills']]

gendalf =
  Human.new(
    artifacts: ArtifactsFactory.build(magician_config))

gendalf.description
