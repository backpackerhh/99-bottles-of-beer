99.downto(1) do |number|
  if number == 1
    puts "1 bottle of beer on the wall, 1 bottle of beer."
    puts "Take one down and pass it around, no more bottles of beer on the wall."
  elsif number == 2
    puts "2 bottles of beer on the wall, 2 bottles of beer."
    puts "Take one down and pass it around, 1 bottle of beer on the wall."
  else
    puts "#{number} bottles of beer on the wall, #{number} bottles of beer."
    puts "Take one down and pass it around, #{number - 1} bottles of beer on the wall."
  end
end

puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
