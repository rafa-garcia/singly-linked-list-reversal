# frozen_string_literal: true

require 'minitest/autorun'
require './exercise'

describe LinkedList do
  subject { LinkedNode.new(value: node_value) }

  let(:node_value) { 1 }

  describe '#value' do
    it 'has a value' do
      _(subject.value).must_equal 1
    end
  end

  describe '#next=' do
    let(:next_node) { LinkedNode.new(value: 2) }

    it 'writes a pointer to the next node' do
      subject.next = next_node
      _(subject.next).must_be_instance_of LinkedNode
    end
  end

  describe '#next' do
    let(:next_node) { LinkedNode.new(value: 2) }

    it 'reads a pointer to the next node' do
      _(subject.next).must_be_nil
      subject.next = next_node
      _(subject.next.value).must_equal 2
    end
  end
end

describe LinkedList do
  subject { LinkedList.new(head: node1) }

  let(:node1) { LinkedNode.new(value: 1) }
  let(:node2) { LinkedNode.new(value: 2) }
  let(:node3) { LinkedNode.new(value: 3) }

  before do
    node1.next = node2
    node2.next = node3
  end

  describe '#head' do
    it 'has a head' do
      _(subject.head).must_be_instance_of LinkedNode
    end
  end
end
