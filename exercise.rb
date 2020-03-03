# frozen_string_literal: true

# Today we'll be reversing a linked list. For your implementation please:
#
# Implement a reverse method that reverses a linked list
# Implement a print method that returns the linked list as an array of its values
# Use OOP Principles
# Model a domain that includes a linked list and a node
# Add test coverage. I tend to prefer TDD but it's not important
# Use whatever environment/config/language you find the most comfortable
# A valid example should look something like:
#
# node1 = LinkedNode.new(value: 1)
# node2 = LinkedNode.new(value: 2)
# node3 = LinkedNode.new(value: 3)
#
# node1.next = node2
# node2.next = node3
#
# list = LinkedList.new(head: node1)
#
# list.print #=> [1,2,3]
# list.reverse
# list.print #=> [3,2,1]

LinkedNode = Struct.new(:value, :next, keyword_init: true)

LinkedList = Struct.new(:head, keyword_init: true)
