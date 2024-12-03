DAY = 3; require_relative 'main'; include Main

acc = 0
active = true
load_file_as_list_of_lines.each do |line|
  # Regex seems obvious to me
  line.scan(/mul\((\d{1,3})\,(\d{1,3})\)|(do\(\))|(don\'t\(\))/).each do |scan|
    if active and scan[0] != nil and scan[1] != nil
      acc += scan[0].to_i * scan[1].to_i
    elsif scan[2] != nil
      active = true
    elsif scan[3] != nil
      active = false
    end
  end
end

puts acc
