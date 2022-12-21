# frozen_string_literal: true

input = File.read('./input.txt')

def has_dups?(arr)
  !arr.detect { |e| arr.count(e) > 1 }.nil?
end

def find_idx_where_uniq(input, chunk_size)
  (chunk_size..input.length).each do |idx|
    str = input.slice((idx - chunk_size)..(idx - 1))
    next unless (has_dups?(str.chars)) == false

    puts str
    puts idx
    break
  end
end

find_idx_where_uniq(input, 4)
find_idx_where_uniq(input, 14)

