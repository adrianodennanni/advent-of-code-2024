DAY = 4; require_relative 'main'; include Main

# Load dat as array of arrays
MATRIX = load_file_as_list_of_lines.map do |line|
  line.split('')
end

LINES_COUNT = MATRIX.count
COLUMNS_COUNT = MATRIX.first.count

# Sanity checks
MATRIX.each_with_index { |line, i| raise "Invalid number of columns for line #{line}" if line.count != COLUMNS_COUNT }

# Challenge 2 is easier than 1, no need for recursion
# Run method on all As
acc = 0
MATRIX.each_with_index do |line, y|
  line.each_with_index do |letter, x|
    next if letter != 'A'
    next if x-1 < 0 || x+1 >= COLUMNS_COUNT
    next if y-1 < 0 || y+1 >= LINES_COUNT

    diagonal_1 = [MATRIX[y-1][x-1], MATRIX[y+1][x+1]]
    diagonal_2 = [MATRIX[y-1][x+1], MATRIX[y+1][x-1]]

    acc += 1 if diagonal_1.include?('M') && diagonal_1.include?('S') && diagonal_2.include?('M') && diagonal_2.include?('S')
  end
end

puts acc
