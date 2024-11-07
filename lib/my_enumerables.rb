# frozen_string_literal: true

# Enumerable methods
module Enumerable
  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_arr = []
    my_each do |elem|
      new_arr << elem if yield(elem)
    end
    new_arr
  end

  def my_all?(&)
    new_arr = my_select(&)
    new_arr.length == length
  end

  def my_any?(&)
    new_arr = my_select(&)
    new_arr.length.positive?
  end

  def my_none?(&)
    new_arr = my_select(&)
    new_arr.empty?
  end

  def my_count(&)
    return length unless block_given?

    new_arr = my_select(&)
    new_arr.length
  end

  def my_map
    return unless block_given?

    new_arr = []
    my_each do |elem|
      new_arr << yield(elem)
    end
    new_arr
  end

  def my_inject(initial_value)
    accumulator = initial_value
    my_each do |elem|
      accumulator = yield(accumulator, elem)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end
end
