arr = [
  { 'Hanoi' => ['CauGiay', 'vung xanh'] },
  { 'Hanoi' => ['LongBien', 'vung do'] },
  { 'Hanoi' => ['Metri', 'vung xanh'] }
]

result = Hash.new { |hash, key| hash[key] = [] }

arr.each do |hash|
  province = hash.keys.first
  district, area = hash.values.first
  result[area] << "#{district} - #{province}"
end

puts result
