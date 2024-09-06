input = gets.chomp
# Dao nguoc chuoi
reverse = input.reverse
puts "#{reverse}"
# Bo dau space
puts "#{input.split.inject('') { |str, substr| str.to_s + substr.to_s }}"

# Kiem tra chuoi co dinh email khong
def check_email_template(string)
  return true if string.match(/\A[\w+.-]+@[a-z\d.-]+\.[a-z]+\z/i)

  false
end
puts check_email_template(input)
