array = [{"Hanoi": ["CauGiay", "vung xanh"] },  {"Hanoi" => ["LongBien", "vung do"]},  {"Hanoi" => ["Metri", "vung xanh"]}]


newArray = {}

array.each do |value|
  city = value.keys.first
  district, zone = value.values.first
  # khởi tạo mảng mới nếu trống
  newArray[zone] ||= []
   newArray[zone] <<  "#{district} - #{city}"
end

puts newArray