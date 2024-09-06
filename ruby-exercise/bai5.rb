require "json"

path_file = "../public/file/users.json"

file = File.read(path_file)
users = JSON.parse(file)


def role_admin(users, path_file)
  puts "Choose one of the following programs"
  puts "1. Add new user"
  puts "2. Update user"
  puts "3. Delete user"
  puts "4. Search user"
  puts "5. Turn off program"

  choose = gets.chomp.to_i
  
  case choose
  when 1
    puts "Enter name"
    name = gets.chomp
    puts "Enter username"
    username = gets.chomp
    puts "Enter password"
    password = gets.chomp
    new_user = {
      "id" => users.last["id"] + 1,
      "name" => name,
      "username" => username,
      "password" => password,
      "role" => "user"
    }
    users.push(new_user)
    new_data = JSON.pretty_generate(users)
    File.open(path_file, "w") do |f|
      f.write(new_data)
    end
  when 2
    puts "Enter id"
    id = gets.chomp.to_i

    user_by_id = users.find{|user| user["id"] == id}

    puts "Enter name"
    name = gets.chomp
    puts "Enter username"
    username = gets.chomp
    puts "Enter password"
    password = gets.chomp

    name ||= user_by_id["name"]
    username ||= user_by_id["username"]
    username ||= user_by_id["password"]
    update_user = {
      "name" => name,
      "username" => username,
      "password" => password,
      "role" => "user"
    }

    users.map do ||
      
    end
    
  else
    
  end

  puts "Do you want to continue the program? (y/n)"
  if gets.chomp == "y"
    role_admin(users, path_file)
  end
end


puts "Enter username: "
username = gets.chomp
puts "Enter password"
password = gets.chomp

checkUserLogin = users.find{|user| user["username"] == username && user["password"] == password}
if checkUserLogin
  if checkUserLogin["role"] == "admin"
    role_admin(users, path_file)
  else
    # roleUser()
  end
  
else
  puts "Tài khoản không tồn tại!"
end






