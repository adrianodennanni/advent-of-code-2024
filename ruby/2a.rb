DAY = 2; require_relative 'main'; include Main

number_safe = 0

def safe?(report)
  stable = true
  positive = false
  negative = false
  (0..(report.size - 2)).each do |i|
    difference = report[i] - report[i + 1]

    if difference > 3 || difference < -3 || difference == 0
      stable = false
      break
    end

    positive = true if difference > 0
    negative = true if difference < 0
  end

  stable and (positive ^ negative)
end

load_file_as_list_of_lines.map do |line|
  number_safe += 1 if safe?(line.split(/\s+/).map(&:to_i))
end

puts number_safe
