input = File.read('./input.txt')
numbers = input.split("\n").map(&:to_i)
puts numbers.inject(0, :+)
