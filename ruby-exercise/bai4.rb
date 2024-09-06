def reverse_string(str)
    str.reverse
end

def remove_spaces(str)
    str.gsub(/\s+/, '')  
end

def valid_email?(str)
    /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match?(str)
end

print "Nhập chuỗi: "
input_string = gets.chomp

reversed_string = reverse_string(input_string)
puts "Chuỗi đảo ngược: #{reversed_string}"

no_space_string = remove_spaces(input_string)
puts "Chuỗi không dấu space: #{no_space_string}"

if valid_email?(input_string)
    puts "Chuỗi là một email hợp lệ."
else
    puts "Chuỗi không phải là một email hợp lệ."
end
  