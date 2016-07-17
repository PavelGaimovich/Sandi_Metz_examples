# Template pattern
# Alternative for AbstractClass in Ruby
class AnimalTemplate
  attr_reader :jump, :size

  def initialize(args)
    @jump = args[:jump] || default_jump
    @size = args[:size] || default_size
  end

  def default_jump
    raise NotImplementedError, "There not setted default_jump for #{self.class}"
  end

  def default_size
    raise NotImplementedError, "There not setted default_size for #{self.class}"
  end
end

class Bear < AnimalTemplate
  attr_reader :power
  def initialize(args)
    @power = args[:power]
    super(args)
  end

  def default_size
    100
  end
end

vinnie = Bear.new({power:2000})
