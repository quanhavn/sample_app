data = [
  {"Hanoi" => ["CauGiay", "vung xanh"]},
  {"Hanoi" => ["LongBien", "vung do"]},
  {"Hanoi" => ["Metri", "vung xanh"]}
]

data_convert = Hash.new { |hash, key| hash[key] = [] }

data.each do |hash|
  hash.each do |city, (district, zone)|
    result[zone] << "#{district} - #{city}"
  end
end

puts data_convert
