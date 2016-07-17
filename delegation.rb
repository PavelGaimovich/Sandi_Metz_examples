# Delegating messages
# Standart delegation would be, if you send message to SubClass and
# then this have not one, SubClass send message to SuperClass.
require "forwardable"
class Abc
  extend Forwardable

  delegate [:size, :each, :join] => :@parts

  attr_reader :parts
  def initialize
    @parts = ['a','b','c']
  end

  def to_s
    @parts.join(',')
  end
end

abc = Abc.new
p abc.to_s
#delegated
p abc.join(',')
p abc.size
