# frozen_string_literal: true

class String
  def each_character_with_index_from(from_index)
    self.split("")[from_index..-1].each_with_index do |chr, index|
      yield(chr, index + from_index) if block_given?
    end
  end
end
