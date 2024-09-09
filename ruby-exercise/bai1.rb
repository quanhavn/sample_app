array = []

print "Nhập số lượng phần tử n: "
n = gets.chomp.to_i 

puts "Nhập vào #{n} phần tử (nhập số):"
n.times do
  print "Nhập phần tử: "
  input = gets.chomp.to_i
  array << input
end

puts "Mảng đã nhập: #{array}"
puts "Gia tri nho nhat trong mang la: #{array.min}"

average = array.sum / array.size
puts "Gia tri trung bing cua mang la: #{average}"

sum = array.inject(:+)
puts "Tong cua mang la: #{sum}"

elements_greater_than_10 = array.select { |num| num > 10 }
puts "Các phần tử có giá trị > 10 là: #{elements_greater_than_10}"

first_greater_than_10 = array.find { |num| num > 10 }
if first_greater_than_10
  puts "Phần tử đầu tiên có giá trị > 10 là: #{first_greater_than_10}"
else
  puts "Không có phần tử nào có giá trị > 10"
end
