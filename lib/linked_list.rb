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
    ll = ""
    if @size == 0
      "| |"
    elsif @size == 1
      "| #{@first_item.payload} |"
    else
      (@size - 1).times do |i|
        ll << "#{get(i)}, "
      end
        ll << "#{@last_item.payload} "
      return "| #{ll}|"
    end
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
      current_node = @first_item
      index.times do
        current_node = current_node.next_item
      end
      current_node.payload
    end
  end
end
