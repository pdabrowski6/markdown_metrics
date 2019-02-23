# frozen_string_literal: true

class String
  def each_character_with_index_from(from_index)
    self.split("")[from_index..-1].each_with_index do |chr, index|
      yield(chr, index + from_index) if block_given?
    end
  end

  def each_character_with_index
    self.split("").each_with_index do |chr, index|
      next if !@skip_iteration_index.nil? && @skip_iteration_index >= index

      skip_iteration_index = catch :skip_iteration do
        yield(chr, index) if block_given?
      end

      @skip_iteration_index = skip_iteration_index if skip_iteration_index.kind_of?(Integer)
    end
  end
end
