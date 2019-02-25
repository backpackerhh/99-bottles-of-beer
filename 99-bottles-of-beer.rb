class BottlesSong
  MAX_BOTTLES = 99
  BUILDER_KLASS_NAMES = {
    0 => 'NoBottles',
    1 => 'OneBottle',
    2 => 'TwoBottles',
    3..MAX_BOTTLES => 'MultipleBottles'
  }

  def self.build
    MAX_BOTTLES.downto(0).map { |number| builder_for(number) }.join("\n")
  end

  private_class_method def self.builder_for(number)
    klass_name = BUILDER_KLASS_NAMES.select { |number_of_bottles| number_of_bottles === number }.values.first
    builder = const_get(klass_name).new(number)

    <<~TEXT
      #{builder.current_bottles.capitalize} of beer on the wall, #{builder.current_bottles} of beer.
      #{builder.action}, #{builder.remaining_bottles} of beer on the wall.
    TEXT
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
