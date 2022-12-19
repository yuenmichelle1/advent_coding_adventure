# frozen_string_literal: true

require 'set'

def pair_sections(pair)
  pair.split(',').map do |section|
    section_arr = section.split('-').map(&:to_i)
    Set.new(Range.new(section_arr[0], section_arr[1]))
  end
end

def part_one(all_pairs)
  fully_contained_set_count = 0
  all_pairs.each do |pair|
    elf_one_section, elf_two_section = pair_sections pair
    fully_contained_set_count += 1 if (elf_one_section <= elf_two_section) || (elf_two_section <= elf_one_section)
  end
  fully_contained_set_count
end

def part_two(all_pairs)
  overlap_set_count = 0
  all_pairs.each do |pair|
    elf_one_section, elf_two_section = pair_sections pair
    overlap_set_count += 1 if elf_one_section.intersect? elf_two_section
  end
  overlap_set_count
end

puts part_one(File.read('./input.txt').split("\n"))
puts part_two(File.read('./input.txt').split("\n"))
