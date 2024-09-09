id_name_hash = {
  1 => "Quan",
  2 => "CHien",
  3 => "Phuc",
  4 => "Linh",
  5 => "Tien"
}

loop do
  puts "\nBạn muốn tìm theo ID hay theo name?"
  puts "1. Tìm name theo ID"
  puts "2. Tìm ID theo name"
  puts "3. Thoát"
  print "Chọn (1/2/3): "
  option = gets.chomp.to_i

  case option
  when 1
    print "Nhập ID: "
    id = gets.chomp.to_i
    if id_name_hash.has_key?(id)
      puts "Name tương ứng với ID #{id} là: #{id_name_hash[id]}"
    else
      puts "Không tìm thấy ID #{id}"
    end
  when 2
    print "Nhập name: "
    name = gets.chomp
    id = id_name_hash.key(name)
    if id
      puts "ID tương ứng với name '#{name}' là: #{id}"
    else
      puts "Không tìm thấy name '#{name}'"
    end
  when 3
    puts "Thoát chương trình."
    break
  else
    puts "Lựa chọn không hợp lệ. Vui lòng chọn lại."
  end
end
