require 'json'

def read_json_file(file_path)
  JSON.parse(File.read(file_path))
end

def write_json_file(file_path, data)
  File.write(file_path, JSON.pretty_generate(data))
end

def login(users)
  print "Nhập username: "
  username = gets.chomp
  print "Nhập password: "
  password = gets.chomp

  user = users.find { |u| u['username'] == username && u['password'] == password }
  if user
    user['role']
  else
    puts "Tên người dùng hoặc mật khẩu không chính xác."
    nil
  end
end

def admin_functions(computers, users)
    loop do 
        puts "\nchon chuc nang: "
        puts "1. them thong tin may tinh"
        puts "2. sua thong tin may tinh"
        puts "3. xoa thong tin may tinh"
        puts "4. tim kiem thong tin may tinh"
        puts "5. them nguoi dung"
        puts "6. sua nguoi dung"
        puts "7. xoa nguoi dung"
        puts "8. thoat"
        print "chon (1-8): "
        choice = gets.chomp.to_i

        case choice
        when 1
          print "nhap id may tinh: "
          id = gets.chomp.to_i
          print "nhap ten may tinh: "
          name = gets.chomp
          print "nhap cau hinh may tinh: "
          specs = gets.chomp
          computers << {'id' => id, 'name' => name, 'specs' => specs}
          write_json_file('computers.json', computers)
          puts "da them may tinh thanh cong"
        when 2
          print "nhap id may tinh can sua: "
          id = gets.chomp.to_i
          computer = computers.find {|c| c['id'] == id}
          if computer 
              print "nhap ten moi (#{computer['name']}): "
              name = gets.chomp
              print "nhap cau hinh moi (#{computer['specs']}): "
              specs = gets.chomp
              computer['name'] = name unless name.empty?
              computer['specs'] = specs unless specs.empty?
              write_json_file('computers.json', computers)
              puts "da sua may tinh thanh cong"
          else
              puts "may tinh khong ton tai"
          end
        when 3
          print "nhap id may tinh can xoa: "
          id = gets.chomp.to_i
          computers.reject! {|c| c['id'] == id}
          write_json_file('computers.json', computers)
          puts "da xoa may tinh thanh cong"
        when 4
          print "nhap id may tinh can tim: "
          id = gets.chomp.to_i
          computer = computers.find {|c| c['id'] == id}
          if computer
              puts "thong tin may tinh: #{computer}"
          else 
              puts "may tinh khong ton tai"
          end
        when 5
          print "nhap username: "
          username = gets.chomp
          print "nhap password: "
          password = gets.chomp
          print "nhap role (admin/user): "
          role = gets.chomp
          users << {'username' => username, 'password' => password, 'role' => role}
          write_json_file('users.json', users)
          puts "da them thanh cong"
        when 6
          print "nhap username cua ng dung can sua: "
          username = gets.chomp
          user = users.find { |u| u['username'] == username }
          if user 
            print "nhap mat khau moi (#{user['username']}): "
            password = gets.chomp
            print "nhap role moi (#{user['role']}): "
            role = gets.chomp
            user['password'] = password unless password.empty?
            user['role'] = role unless role.empty?
            puts "da sua thanh cong"
          else
            puts "nguoi dung ko ton tai"
          end
        when 7
          print "nhap username cua nguoi dung can xoa: "
          username = gets.chomp
          users.reject! {|u| u['username'] == username}
          write_json_file('users.json', users)
          puts "da xoa nguoi dung thanh cong"
        when 8
          puts "thoat"
          break
        else 
          puts "lua chon khong hop le. vui long chon lai"
        end
    end
end

def user_functions(computers)
    loop do
        puts "chon chuc nang: "
        puts "1. tim kiem thong tin may tinh"
        puts "2. thoat"
        print "chon (1/2): "
        choice = gets.chomp.to_i

        case choice
        when 1
            print "nhap id may tinh can tim: "
            id = gets.chomp.to_i
            computer = computers.find {|c| c['id'] == id}
            if computer
                puts "thong tin may tinh: #{computer}"
            else 
                puts "may tinh khong ton tai"
            end
        when 2
            puts "thoat"
            break
        else 
            puts "lua chon khong hop le. vui long cho lai"
        end
    end
end


users = read_json_file('users.json')
computers = read_json_file('computers.json')

role = login(users)

if role == 'admin'
  admin_functions(computers, users)
elsif role == 'user'
  user_functions(computers)
else
  puts "Đăng nhập thất bại. Vui lòng thử lại."
end