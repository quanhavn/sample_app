puts "Nhap chuoi"
string = gets.chomp

puts "Chuoi nhap nguoc: #{string.reverse()}"
puts "Chuoi bo space: #{string.gsub("\s", "")}"
is_email = string.match(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
puts "Chuoi la email: #{is_email ? 'dung' : 'sai'}"