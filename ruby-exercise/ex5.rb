require 'json'
# Ham doc du lieu
def read_data
  file = File.read('/home/mailinh/code/sample_app/ruby-exercise/data.json')
  JSON.parse(file)
end

# Ham ghi du lieu
def write_data(data)
  File.open('/home/mailinh/code/sample_app/ruby-exercise/data.json', 'w') do |file|
    file.write(JSON.pretty_generate(data))
  end
end

# Ham login
def login(data)
  puts 'Nhap username: '
  username = gets.chomp
  puts 'Nhap password: '
  password = gets.chomp
  user = data['users'].find do |user|
    user['username'] == username && user['password'] == password
  end
  if user
    puts 'Dang nhap thanh cong!'
    user
  else
    puts 'Khong ton tai tai khoan!'
    nil
  end
end

# Ham check role
def check_role(user)
  user['role']
end

# Ham add computer
def add_computer(data)
  puts 'Nhap ten may tinh: '
  name = gets.chomp
  puts 'Nhap gia may tinh: '
  price = gets.chomp.to_i
  puts 'Nhap hang may tinh: '
  brand = gets.chomp

  data['computers'] << { 'name' => name, 'price' => price, 'brand' => brand }
  puts 'Them may tinh thanh cong'
end

# Ham edit computer
def edit_computer(data)
  puts 'Nhap ten may tinh'
  name = gets.chomp
  computer = data['computers'].find do |computer|
    computer['name'] == name
  end
  if computer
    puts 'Nhap ten moi: '
    computer['name'] = gets.chomp
    puts 'Nhap gia moi: '
    computer['price'] = gets.chomp.to_i
    puts 'Nhap brand moi: '
    computer['brand'] = gets.chomp
    puts 'Cap nhat thong tin thanh cong'
  else
    puts 'Khong co du lieu'
  end
end

# Ham xoa computer
def delete_computer(data)
  puts 'Nhap ten may tinh'
  name = gets.chomp
  computer = data['computers'].find do |computer|
    computer['name'] == name
  end
  if computer
    data['computers'].delete(computer)
    puts 'Xoa data thanh cong'
  else
    puts 'Khong co du lieu'
  end
end

# Ham search computer
def search_computer(data)
  puts 'Nhap ten may tinh'
  name = gets.chomp
  data['computers'].find do |computer|
    computer['name'] == name
  end
end

# Ham delete User
def delete_user(data)
  puts 'Nhap ten user ban muon xoa:'
  name_user = gets.chomp
  user = data['users'].find do |user|
    user['username'] == name_user
  end
  if user
    puts 'Ban chac chan muon xoa? y/n'
    answer = gets.chomp
    if answer.downcase == 'y'
      data['users'].delete(user)
      puts 'Xoa data thanh cong'
    else
      puts 'Lua chon khong xoa'
      user
    end
  else
    puts 'Khong co data'
  end
end

# Ham add_user
def add_user(data)
  puts 'Nhap ten username: '
  username = gets.chomp
  puts 'Nhap password'
  password = get.chomp
  puts 'Nhap role'
  role = gets.chomp
  data['users'] << { 'username' => username, 'password' => password, 'role' => role }
  puts 'Them data thanh cong'
end

# Ham sua user
def edit_user(data)
  puts 'Nhap ten user muon xoa:'
  username = gets.chomp
  user = data['users'].find do |user|
    user['username'] == username
  end
  if user
    puts 'Nhap username moi: '
    user['username'] = gets.chomp
    puts 'Nhap role moi'
    user['role'] = gets.chomp
    puts 'Chinh sua thong tin user thanh cong'
  else
    puts 'Khong co du lieu'
  end
end

# main
data = read_data
user = login(data)
if user
  role = check_role(user)
  if role.downcase == 'admin'
    loop do
      puts 'Chon 1.Them computer, 2. Sua computer. 3. Xoa computer. 4. Search computer. 5. Them user. 6. Sua user, 7. Xoa user,  8.Thoat'
      input = gets.chomp.to_i
      case input
      when 1
        add_computer(data)
      when 2
        edit_computer(data)
      when 3
        delete_computer(data)
      when 4
        search_computer(data)
      when 5
        add_user(data)
      when 6
        edit_user(data)
      when 7
        delete_user(data)
      when 8
        write_data(data)
        break
      else
        puts 'Lua chon khong hop le!'
      end
    end
  elsif role.downcase == 'user'
    loop do
      puts 'Chon 1. Search computer. 2. Thoat'
      input = gets.chomp.to_i
      case input
      when 1
        search_computer(data)
      when 2
        write_data(data)
        break
      else
        puts 'Lua chon khong hop le'
      end
    end
  else
    puts 'role khong hop le'
  end
end
