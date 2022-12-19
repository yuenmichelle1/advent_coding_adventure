# frozen_string_literal: true
def pair_sections(pair)
  pair.split(',').map do |section|
    start, finish = section.split('-').map(&:to_i)
    Range.new(start, finish)
  end
end

def part_one(all_pairs)
  fully_contained_set_count = 0
  all_pairs.each do |pair|
    elf_one_section, elf_two_section = pair_sections pair
    fully_contained_set_count += 1 if elf_one_section.cover?(elf_two_section) || elf_two_section.cover?(elf_one_section)
  end
  fully_contained_set_count
end

def part_two(all_pairs)
  overlap_count = 0
  all_pairs.each do |pair|
    elf_one_section, elf_two_section = pair_sections pair
    overlap_count += 1 if elf_one_section.cover?(elf_two_section.first) || elf_two_section.cover?(elf_one_section.first)
  end
  overlap_count
end

puts part_one(File.read('./input.txt').split("\n"))
puts part_two(File.read('./input.txt').split("\n"))
