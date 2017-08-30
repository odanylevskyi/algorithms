def insertionSort(a) 
 if a.size <= 1
		return a
	end
	head = 0
	while head < a.size do
		i = head
		min = i
		while i < a.size do
			if a[i] < a[min]
				min = i
			end
			i+=1
		end
		if head != min
			tmp = a[head]
			a[head] = a[min]
			a[min] = tmp
		end
		head+=1
	end
	return a
end


puts insertionSort([-1, -10000, 1, 3, 5, 7, -200, 0, 0, 12, 100]).to_s
