people = {
  101 => "John",
  102 => "Alice",
  103 => "Bob",
  104 => "Jane"
}

print "Nhập ID hoặc tên: "
input = gets.chomp

if input =~ /^\d+$/
  id = input.to_i
  name = people[id]
  if name
    puts "Tên tương ứng với ID #{id} là: #{name}"
  else
    puts "Không tìm thấy ID #{id}"
  end
else
  id = people.key(input)
  if id
    puts "ID tương ứng với tên #{input} là: #{id}"
  else
    puts "Không tìm thấy tên #{input}"
  end
end
