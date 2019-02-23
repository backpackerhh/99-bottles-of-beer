99.downto(0) do |number|
  current_bottles = if number == 0
                      'no more'
                    else
                      number
                    end
  action = if number == 0
             'Go to the store and buy some more'
           else
             'Take one down and pass it around'
           end
  remaining_bottles = if number == 0
                        99
                      elsif number == 1
                        'no more'
                      else
                        number - 1
                      end

  puts "#{current_bottles.to_s.capitalize} bottle#{'s' if number != 1} of beer on the wall, #{current_bottles} bottle#{'s' if number != 1} of beer."
  puts "#{action}, #{remaining_bottles} bottle#{'s' if number != 2} of beer on the wall.\n\n"
end

