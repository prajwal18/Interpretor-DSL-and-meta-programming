# Creating custom object on the fly
# Creating tailor ready object with custom functionality based on the specified characteristics

require_relative './modules/carnivour'
require_relative './modules/herbivour'
require_relative './modules/diurnal'
require_relative './modules/noctornal'

def tailoring_animal(diet, awake)
  animal = Object.new

  if diet == :carnivour
    animal.extend(Carnivour)
  else
    animal.extend(Herbivour)
  end

  if awake == :day
    animal.extend(Diurnal)
  else
    animal.extend(Noctornal)
  end
  animal
end

animal1 = tailoring_animal(:carnivour, :night)
animal2 = tailoring_animal(:herbivour, :day)
animal3 = tailoring_animal(:herbivour, :night)

# printing out the results of our little experiment
puts "\n-------------------------------------------\n\n"
puts "Animal 1, Diet: #{animal1.diet}. Sleep Time: #{animal1.sleep_time}"
puts "Animal 2, Diet: #{animal2.diet}. Sleep Time: #{animal2.sleep_time}"
puts "Animal 3, Diet: #{animal3.diet}. Sleep Time: #{animal3.sleep_time}"
puts "\n-------------------------------------------\n\n"
