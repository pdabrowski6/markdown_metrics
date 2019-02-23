require 'spec_helper'

describe String do
  describe 'each_character_with_index_from' do
    it 'yields each string character starting from the given index' do
      result = []

      'Miracle'.each_character_with_index_from(2) do |chr, i|
        result << [chr, i]
      end

      expect(result).to eq([['r', 2], ['a', 3], ['c', 4], ['l', 5], ['e', 6]])
    end
  end
end
