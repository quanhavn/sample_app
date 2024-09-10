require 'json'

def load_data(filename)
  file = File.read(filename)
  JSON.parse(file)
rescue Errno::ENOENT
  puts "File không tồn tại!"
  exit
end

def save_data(filename, data)
  File.write(filename, JSON.pretty_generate(data))
end

def login(users)
  puts "Đăng nhập"
  print "Username: "
  username = gets.chomp
  print "Password: "
  password = gets.chomp

  users.find { |user| user["username"] == username && user["password"] == password }
end

def check_role(user)
  user["role"] == "admin"
end

def search_computers(computers)
  print "Nhập tên máy tính để tìm kiếm: "
  search_name = gets.chomp
  result = computers.select { |comp| comp["name"].downcase.include?(search_name.downcase) }
  if result.any?
    puts "Kết quả tìm kiếm:"
    result.each { |comp| puts "#{comp['name']} - #{comp['spec']}" }
  else
    puts "Không tìm thấy máy tính!"
  end
end

def add_computer(computers)
  print "Nhập ID: "
  id = gets.chomp.to_i
  print "Nhập tên máy tính: "
  name = gets.chomp
  print "Nhập thông số máy tính: "
  spec = gets.chomp
  computers << { "id" => id, "name" => name, "spec" => spec }
  puts "Đã thêm máy tính thành công!"
end

def delete_computer(computers)
  print "Nhập ID máy tính cần xoá: "
  id = gets.chomp.to_i
  computers.delete_if { |comp| comp["id"] == id }
  puts "Đã xoá máy tính!"
end

def add_user(users)
  print "Nhập username: "
  username = gets.chomp
  print "Nhập password: "
  password = gets.chomp
  print "Nhập quyền (admin/user): "
  role = gets.chomp
  users << { "username" => username, "password" => password, "role" => role }
  puts "Đã thêm người dùng!"
end

def delete_user(users)
  print "Nhập username cần xoá: "
  username = gets.chomp
  users.delete_if { |user| user["username"] == username }
  puts "Đã xoá người dùng!"
end

def main
  filename = "./data.json"
  data = load_data(filename)
  users = data["users"]
  computers = data["computers"]

  user = login(users)

  if user
    puts "Đăng nhập thành công!"
    if check_role(user)
      loop do
        puts "\nChức năng cho Admin:"
        puts "1. Tìm kiếm máy tính"
        puts "2. Thêm máy tính"
        puts "3. Xoá máy tính"
        puts "4. Thêm user"
        puts "5. Xoá user"
        puts "6. Thoát"
        print "Chọn chức năng: "
        choice = gets.chomp.to_i

        case choice
        when 1
          search_computers(computers)
        when 2
          add_computer(computers)
        when 3
          delete_computer(computers)
        when 4
          add_user(users)
        when 5
          delete_user(users)
        when 6
          save_data(filename, data)
          break
        else
          puts "Chức năng không hợp lệ!"
        end
      end
    else
      loop do
        puts "\nChức năng cho User:"
        puts "1. Tìm kiếm máy tính"
        puts "2. Thoát"
        print "Chọn chức năng: "
        choice = gets.chomp.to_i

        case choice
        when 1
          search_computers(computers)
        when 2
          break
        else
          puts "Chức năng không hợp lệ!"
        end
      end
    end
  else
    puts "Tên đăng nhập hoặc mật khẩu không chính xác!"
  end
end

main
