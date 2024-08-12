require './parser/parser'

# In This exercise we are using the parse and simplifying the AST
# Note: AST stands for Abstract Syntax Tree

# function to print the items of a list
def print_list(list)
  list.each do |item|
    puts item
  end
end

puts "\n\n"

# 1) Find all the MP3 files in dir
puts "Find all the MP3 files\n\n"
p1 = 'filename *.mp3'
result1 = Parser.new(p1).expression.evaluate('dir')

print_list(result1)
puts "--------------------------\n\n"

# 2) Find all the MP3 files that are bigger than 500KB in dir
puts "Find all the MP3 files that are bigger than 500KB\n\n"
p2 = 'and (filename *.mp3) (bigger 500)'
result2 = Parser.new(p2).expression.evaluate('dir')

print_list(result2)
puts "--------------------------\n\n"

# 3) Find all the files that are bigger than 500KB in dir
puts "Find all the files that are bigger than 500KB\n\n"
p3 = 'bigger 500'
result3 = Parser.new(p3).expression.evaluate('dir')
print_list(result3)
puts "--------------------------\n\n"

# 4) Find all the files that are smaller than 500KB in dir
puts "Find all the files that are smaller than 500KB\n\n"
p4 = 'not bigger 500'
result4 = Parser.new(p4).expression.evaluate('dir')
print_list(result4)
puts "--------------------------\n\n"

# 5) Find all the files that are MP3 or are smaller than 500KB in dir
puts "Find all the MP3s or files that are samller than 500KB\n\n"
p5 = 'or (not bigger 500) (filename *.mp3)'
result5 = Parser.new(p5).expression.evaluate('dir')
print_list(result5)
puts "--------------------------\n\n"

# 6) Find all the .md or ( MP3 files that are less than 500KB ) in dir
puts "Find all the .md files or \( MP3 files that are less than 500KB \) \n\n"
p6 = 'or (filename *.md) (and (filename *.mp3) (not bigger 500))'
result6 = Parser.new(p6).expression.evaluate('dir')
print_list(result6)
puts "--------------------------\n\n"

# 7) Find all the HTML files in dir
puts "Find all the HTML files\n\n"
p7 = 'filename *.html'
result7 = Parser.new(p7).expression.evaluate('dir')
print_list(result7)
puts "--------------------------\n\n"

# 8) Find all the HTML files that are writable in dir
puts "Find all the HTML files that are writable\n\n"
p8 = 'and (filename *.html) (writable)'
result8 = Parser.new(p8).expression.evaluate('dir')
print_list(result8)
puts "--------------------------\n\n"

# 9) Find all the HTML, CSS or JS files in dir
puts "Find all HTML, CSS or JS files\n\n"
p9 = 'or (or (filename *.html) (filename *.css )) (filename *.js)'
result9 = Parser.new(p9).expression.evaluate('dir')
print_list(result9)
puts "--------------------------\n\n"

# End of Exercise 1 -------------------------
