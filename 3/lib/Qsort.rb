#!/usr/bin/env ruby
#jak dodamy to wrzuci do array.last i znowu quicksort


#program from http://www.cquestions.com/2008/01/c-program-for-quick-sort.html used to be in C

#Functions---------------------------------------------------
module Qsort


	def quicksort(ary, first, last)

		if first >= last 
		#done sort
		return

		end


		if first < last
		pivot = first
		i = first
		j = last
		
		end

		while i < j 


			while ary[i] <= ary[pivot] && i < last 
				i+= 1
			end	
			while ary[j] > ary[pivot] 
				j-= 1
			end
			if i < j
				temp = ary[i]
				ary[i] = ary[j]
				ary[j] = temp
			end	
		end
		temp = ary[pivot]
		ary[pivot] = ary[j]
		ary[j] = temp

		quicksort(ary, first, j-1)
		quicksort(ary, j+1, last)
	end

	def increaseit(howmany)
		for i in (0..self.length - 1) do 
			self[i] = self[i] + 1
		end
	end

	def reset()
		for i in (0.. self.length - 1) do
			self[i] = 0
		end
	end

	def dosomethingfunny()
		puts "There is nothing funny in testing"
	end


end
