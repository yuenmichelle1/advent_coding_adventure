# frozen_string_literal: true

def numeric?(look_ahead)
  look_ahead.to_i.to_s == look_ahead
end

def stack_hash_map(sketch)
  stacks_without_parens = sketch.split("\n").map { |row| row.tr('[]', ' ').scan(/.{1,4}/) }
  stacks_hash = {}

  stacks_without_parens.reverse.each do |row|
    row.each_with_index do |entry, i|
      entry = entry.strip
      next if entry.empty? || numeric?(entry)

      if stacks_hash.key?((i + 1).to_s)
        stacks_hash[(i + 1).to_s].append(entry)
      else
        stacks_hash[(i + 1).to_s] = [entry]
      end
    end
  end
  stacks_hash
end

def do_instructions(instructions, _stacks_hash_map)
  instructions.split("\n").map { instruction.split(' ').filter }
end

sketch, instructions = File.read('./input.txt').split("\n\n")

puts stack_hash_map sketch

puts instructions.split("\n")[0]
