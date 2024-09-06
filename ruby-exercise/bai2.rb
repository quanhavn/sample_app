students = {}

100.times do |i|
  students[i] = "Ten #{i}"
end

puts "Ban muon tim kiem theo name hay id:  "

type = gets.chomp
result = ""
case type
when "name"
  puts "Nhap ten"
  name = gets.chomp
  result = students.invert().filter{|k, v| k == name}
  puts "Ket qua tim kiem la id theo ten: #{result[name]}"
when "id"
  puts "Nhap id"
  id = gets.chomp.to_i
  result = students.filter{|k, v| k == id}
  puts "Ket qua tim kiem ten theo id: #{result[id]}"
else 
   puts "Khong tim thay ket qua"
end