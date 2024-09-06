array_of_hashes = [
  {"Hanoi" => ["CauGiay", "vung xanh"]},
  {"Hanoi" => ["LongBien", "vung do"]},
  {"Hanoi" => ["Metri", "vung xanh"]}
]

result_hash = {}
array_of_hashes.each do |value|
    city = value.keys.first
    location, area = value.values.first
    result_hash[area] ||= []
    result_hash[area] <<  "#{location} - #{city}"
end

puts result_hash
