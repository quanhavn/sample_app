N = gets.chomp.to_i
result = {}
N.times do
  input = gets.chomp.to_i
  if result[input]
    result[input] += 1
  else
    result[input] = 1
  end
end
sort_result = result.sort_by { |_key, value| value }.to_h
puts sort_result
