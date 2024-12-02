DAY = 1; require_relative 'main'; include Main

# Load both lists
list_1 = []
list_2 = []
load_file_as_list_of_lines.each do |line|
  a, b = line.split(/\s+/)
  list_1 << a.to_i
  list_2 << b.to_i
end

# Count occurences of each number in list_2
occurences = {}
list_2.each do |n|
  if occurences.has_key?(n)
    occurences[n] += 1
  else
    occurences[n] = 1
  end
end

# Final calculation
acc = 0
list_1.each do |n|
  if occurences.has_key?(n)
    acc += n * occurences[n]
  end
end

puts acc
