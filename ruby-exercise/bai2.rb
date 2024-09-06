students_info = {}

# init 100 student
100.times do |i|
  students_info[i] = "Ten #{i}"
end

puts "You want find by id or name. if you want find by name, type name. if you want find by id, type id:  "

type = gets.chomp
result = ""

if type == "name"
  puts "Nhap ten"
  name = gets.chomp
  result = students_info.invert().filter{|k, v| k == name}
  puts "Ket qua tim kiem id theo ten la: #{result[name]}"
elsif type == 'id'
  puts "Nhap id"
  id = gets.chomp.to_i
  result = students_info.filter{|k, v| k == id}
  puts "Ket qua tim kiem ten theo id la: #{result[id]}"
end
