require "rubygems/text"
ld = Class.new.extend(Gem::Text).method(:levenshtein_distance)
input = File.read('./input.txt')
raw_claims = input.split("\n")


class Claim
  attr_reader :id, :top, :left, :width, :height

  def initialize(input)
    @id, @top, @left, @width, @height = input.scan(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/).flatten.map(&:to_i)
  end
end

all_ids = []
claim_map = {}
raw_claims.each do |raw_claim|
  claim = Claim.new(raw_claim)
  all_ids << claim.id
  claim.width.times do |x|
    claim.height.times do |y|
      claim_map[[x+claim.top,y+claim.left]] ||= []
      claim_map[[x+claim.top,y+claim.left]] << claim.id
      if claim_map[[x+claim.top,y+claim.left]].size > 1
        all_ids = all_ids - claim_map[[x+claim.top,y+claim.left]]
      end
    end
  end
end

puts claim_map.values.reduce(0) { |sum, xy| xy.size > 1 ? sum + 1 : sum }
puts all_ids
