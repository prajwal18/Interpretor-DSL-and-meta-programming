require 'find'
require_relative './expression'

class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dir).each do |file|
      next unless File.file?(file)

      results << file
    end
    results
  end
end
