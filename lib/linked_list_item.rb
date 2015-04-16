class LinkedListItem
  include Comparable
  attr_reader :payload, :next_item, :last

  def initialize(payload)
    @payload = payload
  end

  def ===(another)
    self.equal? another
  end

  def <=>(another_payload)

    if self.payload.class == Symbol && another_payload.payload.class == String
      return 1
    elsif self.payload.class == String && another_payload.payload.class == Symbol
      return -1
    elsif self.payload.class == Fixnum && another_payload.payload.class == String
      return -1
    elsif self.payload.class == String && another_payload.payload.class == Fixnum
      return 1
    else
    self.payload <=> another_payload.payload
    end
  end

  def next_item=(lli)
    raise ArgumentError, "Can't set next_item to self" if lli == self
    @next_item = lli
  end

  def last?
    next_item.nil?
  end

end
