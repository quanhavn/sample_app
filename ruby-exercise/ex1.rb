arr = []

print 'Enter the number of elements in the array: '
n = gets.chomp.to_i

n.times do |i|
  print "Enter an element #{i + 1}: "
  input = gets.chomp

  begin
    arr << Integer(input)
  rescue ArgumentError
    puts 'Invalid input. Exiting input loop.'
    break
  end
end

if arr.empty?
  puts "\nThe array is empty."
else
  puts "\nThe array is: #{arr.inspect}"
  puts "\nThe minimum value is: #{arr.min}"

  sum = arr.inject(0) { |accumulator, el| accumulator + el }
  puts "\nThe sum of the array is: #{sum}"
  puts "\nThe average value is: #{sum.to_f / arr.length}"

  elements_greater_than_ten = arr.select { |el| el > 10 }
  if elements_greater_than_ten.empty?
    puts "\nNo elements greater than 10 found in the array."
  else
    puts "\nThe elements greater than 10 are: #{elements_greater_than_ten.join(', ')}"
  end

  first_greater_than_ten = arr.find { |el| el > 10 }
  puts first_greater_than_ten ? "\nThe first element greater than 10 is: #{first_greater_than_ten}" : "\nNo element greater than 10 found in the array."
end

