99.downto(0) do |number|
  current_bottles = number
  action = 'Take one down and pass it around'
  remaining_bottles = number - 1

  if number == 0
    current_bottles = 'no more'
    action = 'Go to the store and buy some more'
    remaining_bottles = 99
  elsif number == 1
    remaining_bottles = 'no more'
  end

  puts "#{current_bottles.to_s.capitalize} bottle#{'s' if number != 1} of beer on the wall, #{current_bottles} bottle#{'s' if number != 1} of beer."
  puts "#{action}, #{remaining_bottles} bottle#{'s' if number != 2} of beer on the wall.\n\n"
end
