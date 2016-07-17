# Roles
# Example with hook method post_initialize
module FourLegsStandable
  attr_accessor :legs

  def initialize(args={})
    @legs = args.fetch(:legs, 4)
    post_initialize(args)
  end

  private

  def post_initialize(args)
    nil
  end
end

class Monkey
  include FourLegsStandable

  def foo
    p 'bar'
  end
end

class Unicorn
  include FourLegsStandable

  attr_accessor :corn

  def post_initialize(args)
    @corn = args.fetch(:corn, 1)
  end
end

tom = Monkey.new
jerry = Unicorn.new({corn: 1})

tom.foo
p jerry.corn
