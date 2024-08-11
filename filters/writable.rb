require 'find'
require_relative './expression'

class Writable < Expression
  def evaluate(dir)
    results = []
    Find.find(dir).each do |file|
      next unless File.file?(file)

      results << file if File.writable?(file)
    end
    results
  end
end
