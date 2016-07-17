# Managing dependencies.
# Example how avoid using information about How should response each class
# by holding behaviour in this classes. So the method will know What he want.
class Hello
  attr_reader :user_name, :user_surname

  def initialize
    @user_name, @user_surname = %w(Pavel Gaimovich)
  end

  def say
    'Hello'
  end

  def everyone_say(people)
    people.each { |human|
      p human.say_hello(self)
    }
  end
end

class German
  def say_hello(hello)
    'Guten tag ' << hello.user_name
  end
end

class French
  def say_hello(hello)
    'Bonjuer ' << hello.user_surname
  end
end

class Russian
  def say_hello(hello)
    'Zdravstvuj ' << hello.user_name
  end
end

people = [German.new, French.new, Russian.new]
Hello.new.everyone_say(people)
