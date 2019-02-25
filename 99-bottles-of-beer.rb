class Bottles
  MAX_BOTTLES = 99
  VERSE_BUILDER_KLASS_NAMES = {
    0 => 'NoBottlesVerse',
    1 => 'OneBottleVerse',
    2 => 'TwoBottlesVerse',
    3..MAX_BOTTLES => 'MultipleBottlesVerse'
  }

  def self.build_song
    MAX_BOTTLES.downto(0).map { |number| build_verses_for(number) }.join("\n")
  end

  private_class_method def self.build_verses_for(number)
    klass_name = VERSE_BUILDER_KLASS_NAMES.select { |number_of_bottles| number_of_bottles === number }.values.first
    verse = const_get(klass_name).new(number)

    <<~TEXT
      #{verse.current_bottles.capitalize} of beer on the wall, #{verse.current_bottles} of beer.
      #{verse.action}, #{verse.remaining_bottles} of beer on the wall.
    TEXT
  end

  class VerseTemplate
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

  class NoBottlesVerse < VerseTemplate
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

  class OneBottleVerse < VerseTemplate
    def current_bottles
      '1 bottle'
    end

    def action
      'Take it down and pass it around'
    end

    def remaining_bottles
      'no more bottles'
    end
  end

  class TwoBottlesVerse < VerseTemplate
    def remaining_bottles
      '1 bottle'
    end
  end

  class MultipleBottlesVerse < VerseTemplate
  end
end

puts Bottles.build_song
