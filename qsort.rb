#!/usr/bin/env ruby
#jak dodamy to wrzuci do array.last i znowu quicksort


#program from http://www.cquestions.com/2008/01/c-program-for-quick-sort.html

#Functions---------------------------------------------------
def start(ary)
#Our array at start


print "Gib ints"

#inserting our numbers
a = gets.chomp

#inserts all numbers we gave into array, as int
a.scan(/\w+/) do |ournumber|

ary << Integer(ournumber) #insert ournumber into ary
end
#till here

return ary

end

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





#------------------------------------------------------------------

#MAIN

ary = Array.new
start(ary)
quicksort(ary, 0, ary.length-1)
puts ary










