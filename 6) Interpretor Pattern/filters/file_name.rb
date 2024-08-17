require 'find'
require_relative './expression'

class FileName < Expression
  attr_accessor :pattern

  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir).each do |file|
      next unless File.file?(file)

      name = File.basename(file)

      results << file if File.fnmatch(pattern, name)
    end
    results
  end
end
