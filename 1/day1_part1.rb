# frozen_string_literal: true

max_cals = 0
current_cals = 0
File.read('./day1_inputs.txt').each_line do |line|
  line = line.strip
  if line.empty?
    max_cals = [max_cals, current_cals].max
    current_cals = 0
  else
    current_cals += line.to_i
  end
end

puts max_cals
