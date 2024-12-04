DAY = 4; require_relative 'main'; include Main

# Load dat as array of arrays
MATRIX = load_file_as_list_of_lines.map do |line|
  line.split('')
end

LINES_COUNT = MATRIX.count
COLUMNS_COUNT = MATRIX.first.count
NEXT_LETTER = {
  'X' => 'M',
  'M' => 'A',
  'A' => 'S',
}

# Sanity checks
MATRIX.each_with_index { |line, i| raise "Invalid number of columns for line #{line}" if line.count != COLUMNS_COUNT }

# Solve with recursion
# Direction is one of the 8 possible directions: :n, :ne, :e, :se, :s, :sw, :w, :nw
def sequence_continues?(current_letter, current_x, current_y, cardinal_direction)
  return false if MATRIX[current_y][current_x] != current_letter # Letter does not match
  return true if current_letter == 'S' # Word formed

  next_x, next_y = case cardinal_direction
  when :n
    [current_x, current_y - 1]
  when :ne
    [current_x + 1, current_y - 1]
  when :e
    [current_x + 1, current_y]
  when :se
    [current_x + 1, current_y + 1]
  when :s
    [current_x, current_y + 1]
  when :sw
    [current_x - 1, current_y + 1]
  when :w
    [current_x - 1, current_y]
  when :nw
    [current_x - 1, current_y - 1]
  end

  # Edge cases
  return false if next_x < 0 || next_x >= COLUMNS_COUNT
  return false if next_y < 0 || next_y >= LINES_COUNT

  return sequence_continues?(NEXT_LETTER[current_letter], next_x, next_y, cardinal_direction)
end

# Run method on all Xs
acc = 0
MATRIX.each_with_index do |line, y|
  line.each_with_index do |letter, x|
    next if letter != 'X'

    # Check all directions
    [:n, :ne, :e, :se, :s, :sw, :w, :nw].each do |direction|
      acc += 1 if sequence_continues?('X', x, y, direction)
    end
  end
end

puts acc
