#This class represents the whole list
class LinkedList

  attr_accessor :node_list
  
  def initialize
    @node_list = []
  end


  #Appends a new value to the end of the list
  def append(value)
    new_node = Node.new()
    new_node.set_value(value)
    @node_list.push(new_node)

    #Updates the second-to-last node so its next_node value holds the index of the node we just appended
    if @node_list.length > 1
      new_node_index = @node_list.index(new_node)
      last_node = @node_list[new_node_index - 1]
      last_node.next_node = new_node_index
    end

  end


  #Prepends a new value to the beginning of the list
  def prepend(value)
    new_node = Node.new()
    new_node.set_value(value)
    @node_list.unshift(new_node)

    #Adjusts next_node values for the other nodes in the list.
    #Skips the last node because the next_node value for that one is nil.
    if @node_list.length > 1
      i = 0
      while i < (@node_list.length - 1)
        @node_list[i].next_node = i + 1
        i += 1
      end
    end

  end

  
  #Returns the size of the list
  def size
    list_size = @node_list.length
    puts "The linked list contains #{list_size} nodes."
    return list_size
  end


  #Returns the head node of the list
  def head
    puts "Head node: #{@node_list[0]}"
    return @node_list[0]
  end


  #Returns the tail node of the list
  def tail
    last_index = @node_list.length - 1
    puts "Tail node: #{@node_list[last_index]}"
    return @node_list[last_index]
  end


  #Returns the node at the given index
  def at(index)
    puts "Node at index #{index}: #{@node_list[index]}"
    return @node_list[index]
  end


  #Removes the last node from the list
  def pop
    @node_list.pop

    #Updates the new last node in @node_list to have a next_node value of nil
    @node_list[@node_list.length - 1].next_node = nil
  end


  #Returns true if the list contains value and false if it does not
  def contains?(value)
    i = 0
    while i < @node_list.length
      if @node_list[i].value == value
        return true
      end
      i += 1
    end
    return false
  end


  #Returns the index of the node containing value
  #Returns nil if the value is not found
  def find(value)
    i = 0
    while i < @node_list.length
      puts "value at index #{i}: #{@node_list[i].value}"
      if @node_list[i].value == value
        puts "The linked list contains #{value} at index #{i}."
        return i
      end
      i += 1
    end
    
    puts "The linked list does not contain #{value}"
    return nil
  end


  #Represents the items in the list as strings that can be printed to the console
  def to_s
    #So I need to loop over the list, get the value of each node, and print them.
    i = 0
    while i < @node_list.length
      print "( #{@node_list[i].value} ) => "
      i += 1
    end
    puts "nil"
  end


  #Inserts value at the specified index of @node_list.
  def insert_at(value, index)
    new_node = Node.new()
    new_node.set_value(value)
    @node_list.insert(index, new_node)

    #Update next_node values for nodes after the inserted node
    current_index = @node_list.index(new_node)
    next_index = current_index + 1
    if @node_list[next_index]
      i = current_index
      while i < (@node_list.length - 1)
        @node_list[i].next_node = i + 1
        i += 1
      end
    end

  end


  #Removes the element at the given index
  def remove_at(index)
    @node_list.delete_at(index)

    #Update next_node values for nodes after the deleted node
    i = index
    while i < (@node_list.length - 1)
      @node_list[i].next_node = i + 1
      i += 1
    end
  end

end


#This class represents individual nodes of the linked list
class Node

  attr_accessor :value, :next_node
  
  def initialize
    @next_node = nil
    @value = nil
  end


  #Method to set the value of @value, defaults to nil
  def set_value(val)
    @value = val
    return @value
  end

end


linked_list = LinkedList.new()
linked_list.append(4)
linked_list.append(5)
linked_list.append(6)
linked_list.prepend(3)
linked_list.append(7)
linked_list.prepend(2)
linked_list.append(11)
linked_list.append(13)

linked_list.insert_at(10, 2)
linked_list.to_s
p "linked list: #{linked_list.node_list}"

linked_list.remove_at(4)
linked_list.to_s
p "linked list: #{linked_list.node_list}"
