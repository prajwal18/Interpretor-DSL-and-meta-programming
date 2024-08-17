require_relative './filters/all'
require_relative './filters/bigger'
require_relative './filters/writable'
require_relative './filters/file_name'
require_relative './operators/or'
require_relative './operators/and'
require_relative './operators/not'

# function to print the items of a list
def print_list(list)
  list.each do |item|
    puts item
  end
end

puts "\n\n"

# 1) Find all the MP3 files in dir
puts "Find all the MP3 files\n\n"
result1 = FileName.new('*.mp3').evaluate('dir')
print_list(result1)
puts "--------------------------\n\n"

# 2) Find all the MP3 files that are bigger than 500KB in dir
puts "Find all the MP3 files that are bigger than 500KB\n\n"
result2 = And.new(FileName.new('*.mp3'), Bigger.new(500)).evaluate('dir')
print_list(result2)
puts "--------------------------\n\n"

# 3) Find all the files that are bigger than 500KB in dir
puts "Find all the files that are bigger than 500KB\n\n"
result2 = Bigger.new(500).evaluate('dir')
print_list(result2)
puts "--------------------------\n\n"

# 4) Find all the files that are smaller than 500KB in dir
puts "Find all the files that are smaller than 500KB\n\n"
result4 = Not.new(Bigger.new(500)).evaluate('dir')
print_list(result4)
puts "--------------------------\n\n"

# 5) Find all the files that are MP3 or are smaller than 500KB in dir
puts "Find all the MP3s or files that are samller than 500KB\n\n"
result5 = Or.new(FileName.new('*.mp3'), Not.new(Bigger.new(500))).evaluate('dir')
print_list(result5)
puts "--------------------------\n\n"

# 6) Find all the MP3 files that are less than 500KB or are .md files in dir
puts "Find all the MP3 files that are less than 500KB or are .md files \n\n"
result6 = Or.new(And.new(FileName.new('*.mp3'), Not.new(Bigger.new(600))), FileName.new('*.md')).evaluate('dir')
print_list(result6)
puts "--------------------------\n\n"

# 7) Find all the HTML files in dir
puts "Find all the HTML files\n\n"
result7 = FileName.new('*.html').evaluate('dir')
print_list(result7)
puts "--------------------------\n\n"

# 8) Find all the HTML files that are writable in dir
puts "Find all the HTML files that are writable\n\n"
result8 = And.new(FileName.new('*.html'), Writable.new).evaluate('dir')
print_list(result8)
puts "--------------------------\n\n"

# 9) Find all the HTML, CSS or JS files in dir
puts "Find all HTML, CSS or JS files\n\n"
result9 = Or.new(Or.new(FileName.new('*.html'), FileName.new('*.css')), FileName.new('*.js')).evaluate('dir')
print_list(result9)
puts "--------------------------\n\n"

# End of Exercise 1 -------------------------
