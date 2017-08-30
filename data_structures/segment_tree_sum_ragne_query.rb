#!/usr/bin/env ruby


# EXAMPLE:
# [1, 0, -3, 2, 5]
# LENGTH 2n: 4 -> 2*4-1 = 7
# LENGTH 2n+1: 5 -> next 2^n bigger then 5 will be 8 -> 2*8-1 = 15
#      2
#    /   \
#   1     1    EXAMPLE: [1, 0, -3, 2]
#  / \   / \			[0, 0, 0, 0, 0, 0, 0]
# 1   0 -3  2  1. LEFT:  pos = 1, high = 2, low = 0, level = 1
# 												 2. LEFT:  pos = 3, high = 0, low = 0, level = 2 -> [0, 0, 0, 1, 0, 0, 0]
# 												 3. RIGHT: pos = 4, high = 1, low = 1, level = 2 -> [0, 0, 0, 1, 0, 0, 0]
#              4. RIGHT: pos = 2, high = 2, low = 3, level = 1
# 												 5. LEFT:  pos = 3, high = 2, low = 2, level = 2 -> [0, 0, 0, 1, 0, -3, 0]
# 												 6. RIGHT: pos = 4, high = 3, low = 3, level = 2 -> [0, 0, 0, 1, 0, -3, 2]
#              7. RIGHT: pos = 2, high = 2, low = 3, level = 1 -> [0, 0, -1, 1, 0, -3, 2]
#              8. LEFT:  pos = 1, high = 2, low = 0, level = 1 -> [0, 1, -1, 1, 0, -3, 2]
#              9. ROOT:  pos = 0, high = 4, low = 0, level = 0 -> [0, 1, -1, 1, 0, -3, 2]
# 												 
#  	     ____5____ 
# 				  /         \
#  	  -2           7     EXAMPLE: [1, 0, -3, 2, 5]
# 		 /   \        / \
# 	 1    -3      2   5   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
#  / \      
# 1   0   

class SegmentTreeSumRangeQuery 
	attr_accessor :tree, :length

	def initialize(input = [])
		self.build(input)
		self.length = input.size
	end

	def build(input = [])
		if input.empty?
			self.tree = input
		else 
			self.init_tree_array(input.size)
			self.build_tree(input, 0, input.size-1, 0)
		end
	end

	def power_of_two?(x)
		return (x != 0) && ((x & (x - 1)) == 0);
	end

	def get_next_power_of_two(x)
		return 2 ** (Math.log(x)/Math.log(2)).ceil
	end

	def init_tree_array(size = 0)
		if size == 0
			self.tree = []
		else
			self.tree = Array.new(self.get_tree_size(size), 0)
		end
	end

	def get_tree_size(size)
		return power_of_two?(size) ? 2 * size - 1 : 2 * get_next_power_of_two(size) - 1
	end

	def build_tree(input, pos, high, low)
		if low == high
			self.tree[pos] = input[low]
		else 
			mid = (high+low)/2
			build_tree(input, 2*pos+1, mid, low) 
			build_tree(input, 2*pos+2, high, mid+1) 
			self.tree[pos] = self.tree[2*pos+1] + self.tree[2*pos+2]
		end
	end

	def get_value(from, to)
		if from.nil? || to.nil?
			return nil
		else 
			return get_range_sum(from, to, length-1, 0, 0)
		end
	end

 def get_range_sum(from, to, high, low, pos)
		if from <= low && to >= high
			return tree[pos]
		elsif to < low || from > high
			return 0
		else 
			mid = (low+high)/2
			return get_range_sum(from, to, mid, low, 2*pos+1) + get_range_sum(from, to, high, mid+1, 2*pos+2)
		end
	end
end

puts SegmentTreeSumRangeQuery.new([1, 0, -3, 2, 5]).get_value(1,2)


