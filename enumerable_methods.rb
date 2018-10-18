module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_each_with_index
    for i in 0..self.length - 1
      yield self[i], i
    end
    self
  end

  def my_select
  array = []
  self.my_each { |x| array << x if yield(x) }
  array
end

def my_all?
  self.my_each { |x| return false if !yield(x) }
  true
end

def my_any?
  self.my_each { |x| return true if yield(x) }
  false
end

def my_none?
  self.my_any? { |x| return false if yield(x) }
  true
end

def my_count
  if block_given?
  new_arr = self.my_select { |x| return x if yield(x) }
  new_arr.length
  else
    self.length
  end
end

def my_map (proc = nil)
  map_arr = []
  if proc
    self.my_each { |x| map_arr << proc.call(x) }
  elsif block_given?
    self.my_each { |x| map_arr << yield(x) }
  end
  map_arr
end

def my_inject(default = nil)
  default ? total = default : total = self[0]
  for i in self[1...self.length] do
    total = yield(total, i)
  end
  total
end
end

def multiply_els(array)
array.my_inject { |total, x| total * x }
end
