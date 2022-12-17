# frozen_string_literal: true

ALPHABET = ('a'..'z').to_a
# a - z score 1 - 26
# A - Z score 27 - 52
def calculate_priority(item)
  if ALPHABET.index(item).nil?
    ALPHABET.index(item.downcase) + 27
  else
    ALPHABET.index(item) + 1
  end
end

def part_one
  score = 0
  File.open('./input.txt').each_line do |line|
    first_compartment = line[0...(line.length / 2)].split('')
    second_compartment = line[(line.length / 2)...(line.length - 1)].split('')
    similar_item = (first_compartment & second_compartment)[0]
    score += calculate_priority(similar_item)
  end

  puts score
end

def part_two
  score = 0
  all_rucksacks = File.read('./input.txt').split("\n")
  all_rucksacks = all_rucksacks.map { |rucksack| rucksack.split('') }
  elves_bags_split_in_groups = all_rucksacks.each_slice(3).to_a
  elves_bags_split_in_groups.each do |group|
    badge = (group[0] & group[1] & group[2])[0]
    score += calculate_priority(badge)
  end
  puts score
end

part_two
