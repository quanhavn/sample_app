# students = {
#   1 => "Nguyen Van A",
#   2 => "Nguyen Van B",
#   3 => "Nguyen Van C",
#   4 => "Nguyen Van D",
#   5 => "Nguyen Van E",
#   6 => "Nguyen Van F"
# }

# puts "Nhap ma sinh vien tu 1 -> 6 de lay ra ten sinh vien"

# n = gets.chomp.to_i

# puts "Ten sinh vien la: '#{students[n]}'"


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