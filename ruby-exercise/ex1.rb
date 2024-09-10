array = []

loop do
  print "Nhập số (hoặc nhập chữ để dừng): "
  input = gets.chomp
  break if input =~ /[a-zA-Z]/
  array << input.to_i
end

puts "Mảng vừa nhập: #{array}"

puts "Giá trị nhỏ nhất của mảng: #{array.min}"

average = array.sum / array.size
puts "Giá trị trung bình của mảng: #{average}"

sum = array.inject(:+)
puts "Tổng của mảng dùng inject: #{sum}"

greater_than_10 = array.select { |num| num > 10 }
puts "Các phần tử có giá trị > 10: #{greater_than_10}"

first_greater_than_10 = array.find { |num| num > 10 }
puts "Phần tử đầu tiên có giá trị > 10: #{first_greater_than_10}"
