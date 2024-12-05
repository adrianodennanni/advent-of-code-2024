DAY = 5; require_relative 'main'; include Main

# Load dat as array of arrays
line_break = false
rules = []
books = []
load_file_as_list_of_lines.map do |line|
  if line == ''
    line_break = true
    next
  end

  if line_break
    books << line.split(',').map(&:to_i)
  else
    rules << line.split('|').map(&:to_i)
  end
end

# Sanity check, or else we won't find middle numbers
books.each { |b| raise "Even number of elements in book found" if b.size % 2 == 0 }

# Maybe a heap or tree could solve this, but I think I will make a Hashmap of Sets
# Each set has the pages that must come after it
rules_map = {}
rules.each do |r|
  rules_map[r[0]] = Set.new if rules_map[r[0]].nil?
  rules_map[r[1]] = Set.new if rules_map[r[1]].nil?

  rules_map[r[0]] << r[1]
end

def book_consistent?(book, rules_map)
  book.each_with_index do |page, i|
    # Check if all pages in front of it can be there
    ((i+1)...book.size).each do |j|
      return false if !rules_map[page].include?(book[j])
    end
  end

  return true
end

acc = 0

# Check each book for consistent rules
books.each do |book|
  acc += book[(book.size-1)/2] if book_consistent?(book, rules_map)
end

puts acc
