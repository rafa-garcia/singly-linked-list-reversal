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

    it 'stores a pointer to the next node' do
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
  subject { LinkedList.new(head: node) }

  let(:node) { Minitest::Mock.new }

  describe '#head' do
    it 'has a head' do
      node.expect :value, 1

      LinkedNode.stub :new, node do
        _(subject.head.value).must_equal 1
      end

      assert_mock node
    end
  end

  describe '#reverse' do
    it 'reverses the list' do
      node.expect :value, :first_node
      node.expect :nil?,  false
      node.expect :next,  node
      node.expect :next=, node, [nil]
      node.expect :nil?,  false
      node.expect :next,  node
      node.expect :next=, node, [node]
      node.expect :nil?,  true
      node.expect :value, :last_node

      LinkedNode.stub :new, node do
        _(subject.head.value).must_equal :first_node
        _(subject.reverse).wont_equal subject
        _(subject.head.value).must_equal :last_node
      end

      assert_mock node
    end
  end

  describe '#print' do
    it 'outputs the values' do
      node.expect :nil?,  false
      node.expect :value, 1
      node.expect :next,  node
      node.expect :nil?,  false
      node.expect :value, 2
      node.expect :next,  node
      node.expect :nil?,  true

      LinkedNode.stub :new, node do
        expect { subject.print }.must_output "[1, 2]\n"
      end

      assert_mock node
    end
  end
end

describe 'Acceptance test' do
  subject { LinkedList.new(head: node1) }

  let(:node1) { LinkedNode.new(value: 1) }
  let(:node2) { LinkedNode.new(value: 2) }
  let(:node3) { LinkedNode.new(value: 3) }

  before do
    node1.next = node2
    node2.next = node3
  end

  it 'has a head' do
    _(subject.head).must_be_instance_of LinkedNode
    _(subject.head.value).must_equal 1
  end

  it 'reverses the list' do
    _(subject.head.value).must_equal 1
    _(subject.head.next.value).must_equal 2
    _(subject.head.next.next.value).must_equal 3
    _(subject.head.next.next.next).must_be_nil
    subject.reverse
    _(subject.head.value).must_equal 3
    _(subject.head.next.value).must_equal 2
    _(subject.head.next.next.value).must_equal 1
    _(subject.head.next.next.next).must_be_nil
  end

  it 'prints the list' do
    expect { subject.print }.must_output "[1, 2, 3]\n"
  end

  it 'reverses and prints out the list' do
    expect { subject.print }.must_output "[1, 2, 3]\n"
    subject.reverse
    expect { subject.print }.must_output "[3, 2, 1]\n"
  end
end
