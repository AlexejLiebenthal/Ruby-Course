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
class AreaCode
  include InputModule
  def run
    puts 'Welcome to the Area Code Finder'
    25.times { print '-' }
    puts

    while continue?
      city = city_input
      area_code(city)
    end
  end

  private

  def continue?
    input = get_single_input('Do you want to lookup an area code based on a city (Y/N)')
    input = get_single_input '' until %w[y n].include?(input)
    2.times { puts }
    input.downcase == 'y'
  end

  def city_input
    puts 'Which city do you want the area code for?'
    puts area_codes.keys.join("\n")
    get_input("Enter your selection\n")
  end

  def area_code(city)
    puts "The area code for '#{city}' is '#{area_codes.key?(city) ? area_codes[city] : 'unknown'}'"
    puts
  end

  def area_codes
    {
      'munich' => '089',
      'hamburg' => '040',
      'berlin' => '030'
    }
  end
end

AreaCode.new.run
