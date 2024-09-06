arrs = [{ 'Hanoi' => ['CauGiay', 'vung xanh'] }, { 'Hanoi' => ['LongBien', 'vung do'] },
        { 'Hanoi' => ['Metri', 'vung xanh'] }]

result = {}
arrs.each do |arr|
  arr.each do |city, (location, color)|
    if result[color]
      result[color] << "#{location} - #{city}"
    else
      result[color] = []
      result[color] << "#{location} - #{city}"
    end
  end
end
puts result
