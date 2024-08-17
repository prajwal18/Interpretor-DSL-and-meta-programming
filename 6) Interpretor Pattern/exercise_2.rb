require_relative './filters/exercise2_expression'

# function to print the items of a list
def print_list(list)
  list.each do |item|
    puts item
  end
end

puts "\n\n"

# 1) Find all the MP3 files in dir
puts "Find all the MP3 files\n\n"
result1 = matches('*.mp3').evaluate('dir')

print_list(result1)
puts "--------------------------\n\n"

# 2) Find all the MP3 files that are bigger than 500KB in dir
puts "Find all the MP3 files that are bigger than 500KB\n\n"
result2 = (
  matches('*.mp3') & bigger(500)
).evaluate('dir')

print_list(result2)
puts "--------------------------\n\n"

# 3) Find all the files that are bigger than 500KB in dir
puts "Find all the files that are bigger than 500KB\n\n"
result3 = bigger(500).evaluate('dir')
print_list(result3)
puts "--------------------------\n\n"

# 4) Find all the files that are smaller than 500KB in dir
puts "Find all the files that are smaller than 500KB\n\n"
result4 =  smaller(500).evaluate('dir')
print_list(result4)
puts "--------------------------\n\n"

# 5) Find all the files that are MP3 or are smaller than 500KB in dir
puts "Find all the MP3s or files that are samller than 500KB\n\n"
result5 = (
  matches('*.mp3') | smaller(500)
).evaluate('dir')
print_list(result5)
puts "--------------------------\n\n"

# 6) Find all the .md or ( MP3 files that are less than 500KB ) in dir
puts "Find all the .md files or \( MP3 files that are less than 500KB \) \n\n"
result6 = (
  (matches('*.mp3') & smaller(500)) | matches('*.md')
).evaluate('dir')
print_list(result6)
puts "--------------------------\n\n"

# 7) Find all the HTML files in dir
puts "Find all the HTML files\n\n"
result7 = matches('*.html').evaluate('dir')
print_list(result7)
puts "--------------------------\n\n"

# 8) Find all the HTML files that are writable in dir
puts "Find all the HTML files that are writable\n\n"
result8 = (matches('*.mp3') & writable).evaluate('dir')
print_list(result8)
puts "--------------------------\n\n"

# 9) Find all the HTML, CSS or JS files in dir
puts "Find all HTML, CSS or JS files\n\n"
result9 = (
  matches('*.css') | matches('*.html') | matches('*.js')
).evaluate('dir')
print_list(result9)
puts "--------------------------\n\n"

# End of Exercise 1 -------------------------
