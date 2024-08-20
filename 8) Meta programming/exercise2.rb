require_relative './composite/pine'
require_relative './composite/tiger'
require_relative './composite/jungle'
require_relative './composite/species'
require_relative './composite/composite_base'

tiger = Tiger.new('P-tigres')
pine_tree = Pine.new('Pineforous')

jungle = Jungle.new('Tropical Forest')
pantera = Species.new('Panthera')
conifers = Species.new('Conifers')

pantera.add_sub_classification(tiger)
jungle.add_sub_population(tiger)
jungle.add_sub_population(pine_tree)
conifers.add_sub_classification(pine_tree)

# printing the results
puts "\n------------- Exploring Leafs -------------\n"
puts "\n-------------------------------------------\n\n"
puts "Name: #{tiger.name}, Parent Classification: #{tiger.parent_classification.name}, Parent Population: #{tiger.parent_population.name}"
puts "Name: #{pine_tree.name}, Parent Classification: #{pine_tree.parent_classification.name}, Parent Population: #{pine_tree.parent_population.name}"
puts "\n-------------------------------------------\n\n"

puts "\n----------- Exploring Composites ----------\n"
puts "\n-------------------------------------------\n\n"
puts "Name: #{pantera.name}, Sub Classifications: #{pantera.sub_classifications.map(&:name)}\n"
puts "Name: #{conifers.name}, Sub Classifications: #{conifers.sub_classifications.map(&:name)}\n"
puts "Name: #{jungle.name}, Sub Classifications: #{jungle.sub_populations.map(&:name)}"
puts "\n-------------------------------------------\n\n"
