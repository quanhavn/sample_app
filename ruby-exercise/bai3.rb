array = [{"Hanoi": ["CauGiay", "vung xanh"] },  {"Hanoi" => ["LongBien", "vung do"]},  {"Hanoi" => ["Metri", "vung xanh"]}]


newArray = {}

array.each do |value, key|
  city = value.keys[0]
  district, zone = value.values[0]
  # khởi tạo mảng mới nếu trống
  newArray[zone] ||= []
   newArray[zone] <<  "#{district} - #{city}"
end

puts newArray