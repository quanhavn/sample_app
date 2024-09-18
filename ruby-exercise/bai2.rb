def search_by_id(students_info, id)
  students_info[id]
end

def search_by_name(students_info, name)
  students_info.invert[name]
end

students_info = (0..99).to_h { |i| [i, "Ten #{i}"] }

puts "You want find by id or name. if you want find by name, type name. if you want find by id, type id:  "

type = gets.chomp

if type == "name"
  puts "Enter name"
  name = gets.chomp
  id = search_by_name(students_info, name)
  puts "Ket qua tim kiem id theo ten la: #{id}"
elsif type == 'id'
  puts "Enter id"
  id = gets.chomp.to_i
  name = search_by_id(students_info, id)
  puts "Ket qua tim kiem ten theo id la: #{name}"
end