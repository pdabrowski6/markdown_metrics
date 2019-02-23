require 'spec_helper'

describe String do
  describe 'each_character_with_index_from' do
    it 'yields each character of the given string starting from the given index' do
      result = []

      'Miracle'.each_character_with_index_from(2) do |chr, i|
        result << [chr, i]
      end

      expect(result).to eq([['r', 2], ['a', 3], ['c', 4], ['l', 5], ['e', 6]])
    end
  end

  describe 'each_character_with_index' do
    it 'yields each character of the given string' do
      result = []

      'Miracle'.each_character_with_index do |chr, i|
        result << [chr, i]
      end

      expect(result).to eq([['M', 0], ['i', 1], ['r', 2], ['a', 3], ['c', 4], ['l', 5], ['e', 6]])
    end

    it 'yields and skip given number of interations' do
      result = []

      'Miracle'.each_character_with_index do |chr, i|
        result << [chr, i]
        throw :skip_iteration, 4 if i == 1
      end

      expect(result).to eq([['M', 0], ['i', 1], ['l', 5], ['e', 6]])
    end
  end
end
