DAY = 3; require_relative 'main'; include Main

acc = 0

load_file_as_list_of_lines.each do |line|
  # Regex seems obvious to me
  line.scan(/mul\((\d{1,3})\,(\d{1,3})\)/).each do |a, b|
    acc += a.to_i * b.to_i
  end
end

puts acc
