# Hook messages
# In this example as a hook message was usd post_initialize
# to avoid writing super in class initialize method.
class Animal
  attr_reader :jump, :dance

  def initialize(args)
    @jump = args[:jump]
    @dance = args[:dance]

    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def out
    {say: 'raarar',
    jump: 10}
  end

  def hi
    'hi'
  end

  def say
    p "jump=#{@jump}, dance=#{@dance}"
  end
end

class Cat < Animal
  def out
    super.merge({sleep:16})
  end
end

class Dog < Animal
  attr_reader :bark

  def post_initialize(args)
    @bark = args[:bark]
  end
end

Cat.new({jump:1, dance:1}).say
Dog.new({jump:1, dance:1}).say
