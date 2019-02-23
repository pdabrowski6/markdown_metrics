require 'spec_helper'

describe Array do
  describe 'each_with_index_and_catch' do
    it 'yields each element of the given array' do
      result = []

      ['M', 'i', 'r', 'a', 'c', 'l', 'e'].each_with_index_and_catch do |chr, i|
        result << [chr, i]
      end

      expect(result).to eq([['M', 0], ['i', 1], ['r', 2], ['a', 3], ['c', 4], ['l', 5], ['e', 6]])
    end

    it 'yields and skip given number of interations' do
      result = []

      ['M', 'i', 'r', 'a', 'c', 'l', 'e'].each_with_index_and_catch do |chr, i|
        result << [chr, i]
        throw :skip_iteration, 4 if i == 1
      end

      expect(result).to eq([['M', 0], ['i', 1], ['l', 5], ['e', 6]])
    end
  end
end
