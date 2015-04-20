require_relative 'linked_list_item'

class LinkedList
  attr_reader :size

  def initialize(*payload)
    @size = 0
    # index = 0
    payload.each {|payload| push(payload)}
  end

  def index(word)
    if word.to_s == @first_item.payload
      index = 0
    # else
    # current_node = @first_item
    # index.times do
    #   current_node = current_node.next_item
    end
    # index += 1
    # word.to_s = current_node.payload
  end

  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end

  # def to_s
  #   ll = ""
  #   if @size == 0
  #     "| |"
  #   elsif @size == 1
  #     "| #{@first_item.payload} |"
  #   else
  #     (@size - 1).times do |i|
  #       ll << "#{get(i)}, "
  #     end
  #       ll << "#{@last_item.payload} "
  #     return "| #{ll}|"
  #   end
  # end

  def to_s
    str = "| "
    current_item = @first_item
    until current_item.nil?
      str << current_item.payload
      punctuation = current_item.last? ? " " : ", "
      str << punctuation
      current_item = current_item.next_item
    end
    str << "|"
    str
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

  def [](index)
    get(index)
  end

  def []=(index, new_item)
    current_node = @first_item
    index.times do
      current_node = current_node.next_item
    end
    current_node.payload = new_item
  end

  def get(index)
    raise IndexError if index < 0 || @size < index
    if index == 0
      @first_item.payload
    else
      current_node = @first_item
      index.times do
        current_node = current_node.next_item
        raise IndexError if current_node.nil?
      end
      current_node.payload
    end
  end

  def delete(index)
    raise IndexError if @size < index
    current_node = @first_item
    if index > 0
      (index - 1).times do
        current_node = current_node.next_item
      end
      current_node.next_item = current_node.next_item.next_item
    elsif index <=0
      @first_item = current_node.next_item
    end
    @size -= 1
  end

end
