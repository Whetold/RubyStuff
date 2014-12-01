require_relative 'OurTab.rb'
#encoding UTF-8
def start(ary)

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


ary = Array.new
start(ary)
quicksort(ary, 0, ary.length-1)
puts ary
