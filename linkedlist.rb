class LinkedList

  # node class initialized in the LinkedList class
  class Node
    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
    attr_accessor :value
    attr_accessor :next_node

    def to_s
      @value
    end
  end

  attr_reader :head

  def initialize (value = nil)
    @head = Node.new(value)
  end

  def append(value)
    node = @head
    node = node.next_node until node.next_node.nil?
    node.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    node = @head
    size = 1
    until node.next_node.nil?
      node = node.next_node
      size += 1
    end
    size
  end

  def tail
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index)
    node = @head
    index.times { node = node.next_node }
    node
  end

  def pop
    node = @head
    prev = nil
    until node.next_node.nil?
      prev = node
      node = node.next_node
    end
    prev.next_node = nil
  end

  def contains?(value)
    return true if @head.value == value
    node = @head
    until node.next_node.nil?
      node = node.next_node
      return true if node.value == value
    end
    false
  end

  def find(data)
    node = @head
    index = 0
    until node.next_node.nil? || node.value == data
      node = node.next_node
      index += 1
    end
    node.value == data ? index : -1
  end

  def to_s
    node = @head
    str = "( #{node} ) -> "
    until node.next_node.nil?
      str += "( #{node.next_node} ) -> "
      node = node.next_node
    end
    str += 'nil'
    str
  end

  def insert_at(index, value)
    node = @head
    prev = nil
    index.times do
      prev = node
      node = node.next_node
    end
    prev.next_node = Node.new(value, node)
  end

  def remove_at(index)
    node = @head
    prev = nil
    index.times do
      prev = node
      node = node.next_node
    end
    prev.next_node = node.next_node
  end

end

list = LinkedList.new('Olalekan')
puts list
list.append('Olugbade')
puts list
list.prepend('Sunday')
puts list
puts "list contains #{list.size} elements"
puts "the first element is #{list.head}"
puts "the last element is #{list.tail}"
puts "the element at index 2 is #{list.at(2)}"
puts 'pop for show!'
list.pop
puts list
puts " "
puts "list contains 'Olalekan' : #{list.contains? 'Olalekan'}"
puts "list contains 'adewale' : #{list.contains? 'adewale'}"
list.append('javascript')
list.append('ruby')
list.append('python')
puts list
puts " "
puts "'javascript' is at index #{list.find 'javascript'}"
puts "'ruby' is at index #{list.find 'ruby'}"
puts "'python' is at index #{list.find 'python'}"
puts "inserting 'good-work' at index 2"
list.insert_at 2, 'good-work'
puts list
puts " "
puts "removing at index 4"
list.remove_at 4
puts list
