array = [{"Hanoi": ["CauGiay", "vung xanh"]},  {"Hanoi" => ["LongBien", "vung do"]},  {"Hanoi" => ["Metri", "vung xanh"]}]


new_hash = {}

array.each do |value|
  city = value.keys.first
  district, zone = value.values.first
  new_hash[zone] ||= []
   new_hash[zone] <<  "#{district} - #{city}"
end

puts new_hash