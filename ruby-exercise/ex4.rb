print "Nhập vào chuỗi: "
input = gets.chomp

reversed_string = input.reverse
puts "Chuỗi đảo ngược: #{reversed_string}"

no_space_string = input.delete(' ')
puts "Chuỗi bỏ dấu space: #{no_space_string}"

def valid_email?(string)
  string =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end

if valid_email?(input)
  puts "Chuỗi là định dạng email."
else
  puts "Chuỗi không phải định dạng email."
end

input.freeze
puts "Chuỗi đã freeze: #{input.frozen?}"
