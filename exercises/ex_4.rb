# frozen_string_literal: true

def add(first_operand, second_operand)
  first_operand + second_operand
end

def subtract(first_operand, second_operand)
  first_operand - second_operand
end

def run
  puts 'first operand'
  first_operand = gets.to_i
  puts 'second operand'
  second_operand = gets.to_i

  puts 'method (add, subtract)'
  method_symbol = gets.strip.chomp.to_sym

  puts send(method_symbol, first_operand, second_operand)
end

run
