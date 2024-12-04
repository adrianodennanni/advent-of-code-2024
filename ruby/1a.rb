DAY = 1; require_relative 'main'; include Main

# Load both lists
list_1 = []
list_2 = []
load_file_as_list_of_lines.each do |line|
  a, b = line.split(/\s+/)
  list_1 << a.to_i
  list_2 << b.to_i
end

# Sort using Ruby's built-in sort
list_1.sort!
list_2.sort!

# Final calculation
acc = 0
list_1.size.times do |i|
  acc += (list_1[i] - list_2[i]).abs
end

puts acc
