def merge_sort(arr)
  return arr if arr.size <= 1

  left, rigth = arr.each_slice((arr.size / 2.0).round).to_a
  merge(merge_sort(left), merge_sort(rigth))
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    left.first <= right.first ? sorted << left.shift : sorted << right.shift
  end
  sorted.concat(left).concat(right)
end
