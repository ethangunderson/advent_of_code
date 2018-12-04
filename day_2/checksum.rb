input = File.read('./input.txt')
boxes = input.split("\n")
exactly_two = 0
exactly_three = 0

boxes.each do |box|
  letters = {}
  box.each_char do |c|
    count = letters.fetch(c, 0)
    letters[c] = count + 1
  end
  exactly_two += 1 if letters.values.any?{ |v| v == 2 }
  exactly_three += 1 if letters.values.any?{ |v| v == 3 }
end

puts exactly_two * exactly_three
