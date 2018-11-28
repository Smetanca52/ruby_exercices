  def merge_sort(n)
      return n if n.size <= 1
      left,rigth = n.each_slice( (n.size/2.0).round ).to_a
      merge(merge_sort(left), merge_sort(rigth))
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
    left.first <= right.first ? sorted << left.shift : sorted << right.shift
    end
    sorted.concat(left).concat(right)
  end
