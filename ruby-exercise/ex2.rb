name_list = {
  '001' => 'Nguyen Van A',
  '002' => 'Nguyen Van B',
  '003' => 'Nguyen Van C'
}

print 'Enter Id or Name: '
input = gets.chomp

if name_list.has_key?(input)
  puts "Name: #{name_list[input]}"
elsif name_list.has_value?(input)
  puts "Id: #{name_list.key(input)}"
else
  puts 'Not found'
end
