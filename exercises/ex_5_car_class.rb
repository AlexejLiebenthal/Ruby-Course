# frozen_string_literal: true

# Class MyCar | props: year, color, model, speed | methods: speed_up, brake, shut_on, shut_off
class MyCar
  attr_reader :year, :color, :model, :engine_running, :speed

  def initialize(model, color, year)
    @engine_running = false
    @speed = 0
    @model = model
    @color = color
    @year = year
  end

  def start_stop_engine
    puts 'Pressing Engine Start/Stop button'
    if engine_running
      stop_engine
      puts 'Engine is currently shut off now'
    else
      start_engine
      puts 'Engine is running now'
    end
  end

  def speed_up
    puts 'speeding up'
    @speed += 10 if @engine_running && (@speed < 250)
    puts "Speed is now: #{speed}"
  end

  def brake
    puts 'breaking'
    @speed -= 10 if @engine_running && @speed.positive?
    puts "Speed is now: #{speed}"
  end

  def to_s
    "Model: #{model}, Year: #{year}, Color: #{color}, Engine Running: #{engine_running}, Speed: #{speed}"
  end

  private

  def start_engine
    @engine_running = true
  end

  def stop_engine
    @engine_running = false
    @speed = 0
  end
end

car = MyCar.new('BMW', 'blue', 2020)

puts car.to_s

car.speed_up
car.brake

car.start_stop_engine

car.speed_up
car.speed_up
car.speed_up
car.speed_up

car.start_stop_engine
car.start_stop_engine

car.speed_up
car.speed_up
car.brake
car.brake
car.brake
car.brake

car.start_stop_engine

puts car.to_s
