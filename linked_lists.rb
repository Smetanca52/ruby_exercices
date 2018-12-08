class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @@counter = 0
  end

  def append(value)
    node = Node.new(value)
    if @tail.nil?
      @tail = node && @head = node
    else
      @tail.next_node = node
      @tail = node
      @tail.next_node = nil
    end
    @@counter += 1
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @tail = node && @head = node
    else
      node.next_node = @head
      @head = node
    end
    @@counter += 1
  end

  def size
    puts "There are #{@@counter} nodes in the list"
  end

  def head
    puts @head.nil? ? 'No nodes yet' : "(  #{@head.value}  )"
  end

  def tail
    puts @tail.nil? ? 'No nodes yet' : "(  #{@tail.value}  )"
  end

  def at(index)
    return head if index.zero?
    return tail if index == -1 || index + 1 == @@counter
    return size if index + 1 > @@counter

    idx_counter = 0
    node = @head
    while idx_counter < index
      node = node.next_node
      idx_counter += 1
    end
    puts "(  #{node.value}  )"
  end

  def contains?(value)
    node = @head
    while node != nil
      return true if node.value == value
      node = node.next_node
    end
    return false
  end

  def find(value)
    node = @head
    idx_counter = 0
    while node != nil
      puts "#{idx_counter}" if node.value == value
      node = node.next_node
      idx_counter += 1
    end
  end

  def pop
    @head = nil && @tail = nil && @@counter = 0 if @@counter <= 1
    node = @head
    while node != nil
      if node.next_node.next_node.nil?
        node.next_node = nil
        @tail = node
        @@counter -= 1
      end
      node = node.next_node
    end
    @@counter
  end

  def to_s
    node = @head
    while node != nil
      print "(  #{node.value}  ) -> "
      node = node.next_node
    end
    puts 'nil'
  end
end

list = LinkedList.new
list.append 87
list.append 837
list.prepend 98
list.prepend 23
list.size
list.head
list.tail
list.pop
list.contains?(32)
list.at(2)
list.find(23)
puts list
