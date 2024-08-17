require 'find'
require_relative './expression'

class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dir).each do |file|
      next unless File.file?(file)

      results << file if File.size(file) > @size
    end
    results
  end
end
