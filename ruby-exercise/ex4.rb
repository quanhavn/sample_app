def is_valid_email(email)
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  email.match?(email_regex)
end

print "Enter the string: "
str = gets.chomp

puts "\nReversed string is: #{str.reverse}"

puts "\nNew string without spaces is: #{str.gsub(' ', '')}"

if is_valid_email(str)
  puts "\n#{str} is a valid email."
else
  puts "\n#{str} is not a valid email."
end
