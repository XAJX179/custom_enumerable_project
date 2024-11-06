module Enumerable
  def my_each_with_index
    i = 0;
    while i < self.length
      yield(self[i],i)
      i+=1;
    end
    self
  end

  def my_select
    new_arr = []
    self.my_each do |elem|
      if yield(elem)
        new_arr << elem
      end
    end
    new_arr
  end

  def my_all?
    new_arr = self.my_select do |elem|
      yield(elem)
    end
    new_arr.length == self.length ? true : false
  end

  def my_any?
    new_arr = self.my_select do |elem|
      yield(elem)
    end
    new_arr.length > 0 ? true : false
  end

  def my_none?
    new_arr = self.my_select do |elem|
      yield(elem)
    end
    new_arr.length == 0 ? true : false
  end

  def my_count
    return self.length unless block_given?

    new_arr = self.my_select { |elem| yield(elem) }
    new_arr.length
  end

  def my_map
    if block_given?
      new_arr=[]
      self.my_each do |elem|
        new_arr << yield(elem)
      end
      new_arr
    end
  end

  def my_inject(initial_value)
    accumulator = initial_value
    self.my_each_with_index do |elem,index|
      accumulator = yield(accumulator,elem)
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
    i = 0;
    while i < self.length
      yield(self[i])
      i+=1;
    end
    self
  end
end
