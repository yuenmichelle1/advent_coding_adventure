# frozen_string_literal: true

ALPHABET = ('a'..'z').to_a
score = 0

def calculate_priority(item)
  if ALPHABET.index(item).nil?
    ALPHABET.index(item.downcase) + 27
  else
    ALPHABET.index(item) + 1
  end
end

File.open('./input.txt').each_line do |line|
  first_compartment = line[0...(line.length / 2)].split('')
  second_compartment = line[(line.length / 2)...(line.length - 1)].split('')
  compartment_intersection_arr = first_compartment & second_compartment
  similar_item = compartment_intersection_arr[0]
  score += calculate_priority(similar_item)
end

puts score
