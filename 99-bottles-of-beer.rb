class BottlesSong
  MAX_BOTTLES = 99

  def self.build
    MAX_BOTTLES.downto(0) do |number|
      builder = builder_for(number)

      puts "#{builder.current_bottles.capitalize} of beer on the wall, #{builder.current_bottles} of beer."
      puts "#{builder.action}, #{builder.remaining_bottles} of beer on the wall.\n\n"
    end
  end

  private_class_method def self.builder_for(number)
    klass = case number
            when 0
              NoBottles
            when 1
              OneBottle
            when 2
              TwoBottles
            else
              MultipleBottles
            end

    klass.new(number)
  end

  class BottleTemplate
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def current_bottles
      "#{number} bottles"
    end

    def action
      'Take one down and pass it around'
    end

    def remaining_bottles
      "#{number - 1} bottles"
    end
  end

  class NoBottles < BottleTemplate
    def current_bottles
      'no more bottles'
    end

    def action
      'Go to the store and buy some more'
    end

    def remaining_bottles
      "#{MAX_BOTTLES} bottles"
    end
  end

  class OneBottle < BottleTemplate
    def current_bottles
      '1 bottle'
    end

    def remaining_bottles
      'no more bottles'
    end
  end

  class TwoBottles < BottleTemplate
    def remaining_bottles
      '1 bottle'
    end
  end

  class MultipleBottles < BottleTemplate
  end
end

BottlesSong.build
