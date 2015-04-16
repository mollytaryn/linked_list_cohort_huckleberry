require_relative 'linked_list_item'

class LinkedList
  attr_reader :payload
  attr_accessor :size

  def initialize
    @size = 0
  end

  def last
    if @size == 0
      @size = nil
    else
      return @last_item.payload
    end
  end

  def to_s
    "|#{@first_item} |"
  end

  def push(item)
    if @first_item.nil?
      @first_item = LinkedListItem.new(item)
      @last_item = @first_item
    else
      @last_item.next_item = LinkedListItem.new(item)
      @last_item = @last_item.next_item
    end
    @size += 1
  end

  def get(index)
    raise IndexError if index < 0 || @first_item == nil || @size < index
    if index == 0
      @first_item.payload
    else
      count = 0
      current_node = @first_item
      while count < index
        current_node = current_node.next_item
        count = count + 1
      end
      current_node.payload
    end
  end
end
