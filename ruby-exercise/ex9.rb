input = gets.chomp
def Chuan_hoa_ten(name)
  # Bo khoang trang
  name.strip!
  words = name.split(/\s+/)
  last_word = words.pop.capitalize
  after = words.map { |word| word[0].upcase }.join
  puts "#{last_word}#{after}"
end
Chuan_hoa_ten(input)
