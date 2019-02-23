def bottles_of_beer(number, pluralize_unless = 1)
  "bottle#{'s' if number != pluralize_unless} of beer"
end

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

  puts "#{current_bottles.to_s.capitalize} #{bottles_of_beer(number)} on the wall, #{current_bottles} #{bottles_of_beer(number)}."
  puts "#{action}, #{remaining_bottles} #{bottles_of_beer(number, 2)} on the wall.\n\n"
end
