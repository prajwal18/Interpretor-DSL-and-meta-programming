# Uncomment these to run exercise 2
require_relative './all'
require_relative './bigger'
require_relative './file_name'
require_relative './writable'
require_relative '../operators/and'
require_relative '../operators/or'
require_relative '../operators/not'

class Expression
  def &(other)
    And.new(self, other)
  end

  def |(other)
    Or.new(self, other)
  end

  def exclude(expression)
    Not.new(expression)
  end

  def writable
    Writable.new
  end

  def matches(pattern)
    FileName.new(pattern)
  end

  def >(other)
    Bigger.new(other)
  end

  def <(other)
    Not.new(Bigger.new(other))
  end

  def all
    All.new
  end
end
