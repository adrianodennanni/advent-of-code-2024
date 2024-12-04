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
  report = line.split(/\s+/).map(&:to_i)

  if safe?(report)
    number_safe += 1
  else
    report.size.times do |i|
      report_copy = report.dup
      report_copy.delete_at(i)
      if safe?(report_copy)
        number_safe += 1
        break
      end
    end
  end
end

puts number_safe
