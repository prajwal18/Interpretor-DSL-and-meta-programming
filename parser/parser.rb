require_relative '../filters/all'
require_relative '../filters/bigger'
require_relative '../filters/writable'
require_relative '../filters/file_name'

require_relative '../operators/or'
require_relative '../operators/not'
require_relative '../operators/and'

class Parser
  def initialize(text)
    @tokens = text.scan(/\(|\)|[\w.*]+/)
  end

  def next_token
    @tokens.shift
  end

  def expression
    token = next_token
    if token.nil?
      nil
    elsif token == '('
      result = expression
      raise 'Expected )' unless next_token == ')'

      result
    elsif token == 'and'
      And.new(expression, expression)
    elsif token == 'or'
      Or.new(expression, expression)
    elsif token == 'not'
      Not.new(expression)
    elsif token == 'filename'
      FileName.new(next_token)
    elsif token == 'writable'
      Writable.new
    elsif token == 'bigger'
      Bigger.new(next_token.to_i)
    elsif token == 'all'
      All.new
    else
      raise "Unknown token: #{token}"
    end
  end
end
