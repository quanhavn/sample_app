quan_ly_id = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D' }
condition = true
while condition
  puts 'Chon tim theo ID, Name hoac Thoat'
  input = gets.chomp.downcase
  if input == 'thoat'
    condition = false
  elsif input == 'id'
    puts 'Nhap ID:'
    id = gets.chomp.to_i
    if quan_ly_id[id]
      puts "Nguoi co ID = #{id} la: #{quan_ly_id[id]}"
    else
      puts "Khong co nguoi co ID la #{id}"
    end
  elsif input == 'name'
    puts 'Nhap ten:'
    name = gets.chomp
    if quan_ly_id.key(name.capitalize)
      puts "Nguoi co ten #{name} co ID la: #{quan_ly_id.key(name.capitalize)}"
    else
      puts "Khong co nguoi co ten #{name}"
    end
  else
    puts 'Du lieu nhap khong hop le !!!'
  end
end
