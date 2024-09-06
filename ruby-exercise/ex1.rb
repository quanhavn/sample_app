numbers = Array.new
loop do
    input = gets.chomp
    break if input.match(/[a-zA-Z]/)
    number = input.to_i
    numbers << number
end
#Hien thi mang vua nhap
puts "Mang vua nhap la: #{numbers}"

#Hien thi gia tri nho nhat cua mang
puts "Gia tri nho nhat cua mang la: #{numbers.min}"

#Tinh gia tri trung binh cua mang
average = (numbers.sum / numbers.size).to_f
puts "Gia tri trung binh cua mang la: #{average}"

#Tinh tong dung inject
sum = numbers.inject(0){|sum, number| sum + number}
puts "Tong cua mang la: #{sum}"

#Tim cac phan tu co gia tri > 10
greater_than_10 = numbers.select do |i|
  i > 10
end
puts "Cac phan tu lon hon 10 cua mang la: #{greater_than_10}"

#Tim phan tu co gia tri > 10
first_greater_than_10 = numbers.find do |i|
  i > 10
end
if first_greater_than_10
    puts "Phan tu dau tien > 10 la: #{first_greater_than_10}"
else puts "Khong co phan tu nao > 10"
end
