# frozen_string_literal: true

class Array
  def each_with_index_and_catch
    self.each_with_index do |el, index|
      next if !@skip_iteration_index.nil? && @skip_iteration_index >= index

      skip_iteration_index = catch :skip_iteration do
        yield(el, index) if block_given?
      end

      @skip_iteration_index = skip_iteration_index if skip_iteration_index.kind_of?(Integer)
    end
  end
end
