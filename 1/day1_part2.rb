# frozen_string_literal: true

cal_tracker = [0, 0, 0]
current_cals = 0
File.read('./day1_inputs.txt').split("\n") do |line|
  line = line.strip
  if line.empty?
    if current_cals > cal_tracker[2]
      cal_tracker.pop
      cal_tracker.append(current_cals)
      cal_tracker = cal_tracker.sort.reverse
    end
    current_cals = 0
  else
    current_cals += line.to_i
  end
end

puts cal_tracker.sum
