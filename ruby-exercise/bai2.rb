students_info = (0..99).to_h { |i| [i, "Ten #{i}"] }

puts "You want find by id or name. if you want find by name, type name. if you want find by id, type id:  "

type = gets.chomp
result = ""

if type == "name"
  puts "Enter name"
  name = gets.chomp
  id = students_info.invert[name]
  puts "Ket qua tim kiem id theo ten la: #{id}"
elsif type == 'id'
  puts "Enter id"
  id = gets.chomp.to_i
  name = students_info[id]
  puts "Ket qua tim kiem ten theo id la: #{name}"
end