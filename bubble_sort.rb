def bubble_sort array
  is_sorted = false
	d = (0..array.length - 2)
  until is_sorted
    is_sorted = true
     d.each do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        is_sorted = false
      end
    end
  end
	print array
end

bubble_sort([4,3,78,2,0,2])

def bubble_sort_by array
  is_sorted = false
	d = (0..array.length - 2)
  until is_sorted
    is_sorted = true
     d.each do |i|
		 block = yield(array[i], array[i + 1])
      if block > 0
        array[i], array[i + 1] = array[i + 1], array[i]
        is_sorted = false
      end
    end
  end
	print array
end

bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length
