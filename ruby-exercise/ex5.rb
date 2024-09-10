require 'csv'

module CSVManager
  def self.read(file_path)
    raise "File #{file_path} not found!" unless File.exist?(file_path)

    CSV.read(file_path, headers: true)
  end

  def self.write(file_path, data)
    headers = data.first.headers if data.first.is_a?(CSV::Row)

    CSV.open(file_path, 'w', write_headers: true, headers: headers) do |csv|
      data.each { |row| csv << row.fields }
    end
  end
end

class UserManager
  attr_accessor :users, :user_login

  def initialize(users)
    @users = users
    @user_login = ''
  end

  def login(username, password)
    user = @users.find { |u| u['username'] == username && u['password'] == password }
    if user
      puts "You are logged in as a/an #{user['role']}"
      @user_login = username
      user['role']
    else
      puts "Invalid username or password!"
      nil
    end
  end
end

def display_table(data)
  return puts 'No data available to display.' if data.nil? || data.empty?

  headers = data.headers
  rows = data.map { |item| headers.map { |header| item[header] } }

  # Determine column widths
  column_widths = headers.map { |header| header.length }
  rows.each do |row|
    row.each_with_index do |cell, index|
      column_widths[index] = [column_widths[index], cell.length].max
    end
  end

  # Print header
  header_line = headers.each_with_index.map { |header, index| header.ljust(column_widths[index]) }.join(' | ')
  puts header_line
  puts '-' * header_line.length

  # Print rows
  rows.each do |row|
    row_line = row.each_with_index.map { |cell, index| cell.ljust(column_widths[index]) }.join(' | ')
    puts row_line
  end
end


def search_computer(computers)
  puts "\n-----Search computer function-----"
  loop do
    print "\nEnter computer information: "
    keyword = gets.chomp.downcase

    if keyword.empty?
      results = computers
    else
      filtered_rows = computers.select do |computer|
        computers.headers.any? { |header| computer[header].to_s.downcase.include?(keyword) }
      end
      results = CSV::Table.new(filtered_rows)
    end

    display_table(results)

    print "\nDo you want to search again? (y/n): "
    again = gets.chomp.downcase
    break unless again == 'y'
  end
end


def admin_func(user_manager, computers)
  users = user_manager.users
  user_login = user_manager.user_login
  loop do
    puts "\n=====Admin screen====="
    puts '1. Show user'
    puts '2. Add new user'
    puts '3. Edit user'
    puts '4. Remove user'
    puts '5. Add new computer information'
    puts '6. Edit computer information'
    puts '7. Remove computer information'
    puts '8. Search computer'

    print "\nPlease choose the function you want to use: "
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "\n-----Show user function-----"
      display_table(users)
    when 2
      print 'Enter the username: '
      username = gets.chomp
      print 'Enter the password: '
      password = gets.chomp
      print 'Enter the role: '
      role = gets.chomp

      headers = users.headers
      users << CSV::Row.new(headers, {
        'username' => username,
        'password' => password,
        'role' => role
      })
      CSVManager.write('ruby-exercise/users.csv', users)
      puts "User #{username} has been added."
    when 3
      print 'Enter the username: '
      username = gets.chomp

      user = users.find { |user| user['username'] == username }
      if user
        print 'Enter the new role: '
        user['role'] = gets.chomp
        CSVManager.write('ruby-exercise/users.csv', users)
        puts "User #{username} has been updated."
      else
        puts "User #{username} hasn't been found."
      end
    when 4
      print 'Enter the username: '
      username = gets.chomp
      if user_login != username
        users.delete_if do |user|
          user['username'] == username
        end
        CSVManager.write('ruby-exercise/users.csv', users)
        puts "User #{username} has been removed."
      else
        puts "You can't delete yourself."
      end
    when 5
      print 'Enter the computer name: '
      name = gets.chomp
      print 'Enter the computer information: '
      information = gets.chomp

      headers = computers.headers
      computers << CSV::Row.new(headers, {
        'name' => name,
        'information' => information
      })
      CSVManager.write('ruby-exercise/computers.csv', computers)
      puts "Computer #{name} has been added."
    when 6
      print 'Enter the computer name: '
      name = gets.chomp

      computer = computers.find { |computer| computer['name'] == name }
      if computer
        print 'Enter the new computer information: '
        computer['information'] = gets.chomp
        CSVManager.write('ruby-exercise/computers.csv', computers)
        puts "Computer #{name} has been updated."
      else
        puts "Computer #{name} hasn't been found."
      end
    when 7
      print 'Enter the computer name: '
      name = gets.chomp
      computers.delete_if do |computer|
        computer['name'] == name
      end
      CSVManager.write('ruby-exercise/computers.csv', computers)
      puts "Computer #{name} has been removed."
    when 8
      search_computer(computers)
    else
      puts 'Invalid choice.'
    end
  end
end

def main
  users = CSVManager.read('ruby-exercise/users.csv')
  computers = CSVManager.read('ruby-exercise/computers.csv')
  user_manager = UserManager.new(users)

  print 'Enter your username: '
  username = gets.chomp
  print 'Enter your password: '
  password = gets.chomp

  role = user_manager.login(username, password)
  return unless role

  if role == 'admin'
    admin_func(user_manager, computers)
  else
    search_computer(computers)
  end
end

main
