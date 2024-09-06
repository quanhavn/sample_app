puts "Nhap so phan tu mang: "
n = gets.chomp.to_i
array = []
n.times do |i|
  print "Nhap phan tu thu #{i + 1}: "
  el = gets.chomp.to_f
  # push array 
  array << el
end

puts "Mang vua nhap la: #{array}"

puts "Gia tri nho nhat cua mang la: #{array.min()}"

sum = array.inject(:+)

puts "Gia tri trung binh cua mang la: #{sum/n}"

puts "Tong cua mang la: #{sum}"

puts "Cac phan tu lon hon 10: #{array.filter{|x| x > 10}}"

puts "Phan tu dau tien lon hon 10: #{(array.filter{|x| x > 10}).first()}"
