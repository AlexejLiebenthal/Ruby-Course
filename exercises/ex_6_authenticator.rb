# frozen_string_literal: true

require 'io/console'

# Input Module
module InputModule
  def get_input(label)
    print label
    gets.strip.chomp
  end

  def get_single_input(label)
    print label
    $stdin.getch.strip.chomp
  end
end

# Authenticator
class Authentificator
  include InputModule

  def run
    puts 'Welcome to the authenticator'
    25.times { print '-' }
    puts 'This program will take input from the user and compare password'
    puts 'If password is correct, you will get back the users object'

    loop do
      username = username_input
      password = password_input
      check_username_password(username, password)
      break unless continue?
    end
  end

  private

  def continue?
    input = get_single_input('Press n to quit or any other key to continue')
    2.times { puts }
    input != 'n'
  end

  def username_input
    get_input('Username: ')
  end

  def password_input
    get_input('Password: ')
  end

  def check_username_password(username, password)
    user = users.find { |up| up[:username] == username and up[:password] == password }

    if user
      puts user
    else
      puts 'Credentials were not correct'
    end
  end

  def users
    [
      { username: 'bob', password: 'testtest' },
      { username: 'peter', password: 'testtest' },
      { username: 'alice', password: 'testtest' }
    ]
  end
end

Authentificator.new.run
