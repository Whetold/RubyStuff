#!/usr/bin/env ruby
require 'graph'
#Siec AN


=begin
dane z zajec

1 3
2 1 1
3 4 1
4 1 2 3
5 9 4
6 5 4
7 2 5 6
done


=end


#NODE class
class Node <
	Struct.new(:index, :time, :prev, :est, :eet) #czas rozpoczecia , czas zakoczenia

	
	
	def rt_index
		return index
	end 
	
	def rt_time
		return time
	end
	
	def rt_prev
		return prev
	end
	
	def print_node
		print "#{index} / #{time} / #{prev}" + "\n"
	end
end
#---------------------------------------------
def nodevalues(string)  #function to create a new node, from single line
tmp = Array.new

	string.scan(/\w+/) do |word|
	tmp << word.to_i

	end

	
	wz = Node.new
	if tmp[0] == nil then
	tmp[0] = ""
	end
	wz.index = tmp[0]
	wz.time = tmp[1]
	wz.prev = tmp.drop(2)
	
	
	
	
	return wz
end

def checktroll(ourgrafs)  #jezeli indeks znowu sie pojawi po tym jak pojawil sie w prev to jest cykliczny
	appeared_as_prev = Array.new
	appeared_as_index = Array.new
	
	ourgrafs.each do |x| #making nodes and saving changes
		
		appeared_as_prev << x.rt_prev.first
		appeared_as_index << x.rt_index
		a = appeared_as_index.last
			
		for i in (0..appeared_as_prev.length-1) do
			if a == appeared_as_prev[i]

			abort("NIE ZE MNA TAKIE NUMERY graf czykliczny") #Wychodzi z programu jesli cykliczny
			end		
		end
	end

end

def makepngend(ourgrafs, critical) #make a png with nodes
	howmanyprevs = Array.new
	
	tmpary = Hash.new{|h, k| h[k] = []} #creating likea-twodimensional array
	tmparyprevs = Hash.new{|h, k| h[k] = []}
	i=0
	ourgrafs.each do |x| #making nodes and saving changes
		howmanyprevs << x.rt_prev.length
			for j in (0..howmanyprevs[i]) do #if more previous than 1
				tmparyprevs[i][j] = x.rt_prev[j]
				
				
			end
		
		tmpary[i][0] = x.rt_prev.first
		tmpary[i][1] = x.rt_index
	
		i+=1
		
	end

digraph do
		node(tmpary[0][1])
		red << node(tmpary[0][1])
		for i in (1..ourgrafs.length-1) do
			
			if howmanyprevs[i] <= 1 then
				edge tmpary[i][0], tmpary[i][1]
			end

			if howmanyprevs[i] > 1 then	
				for j in (0..howmanyprevs[i]-1) do
					edge tmparyprevs[i][j], tmpary[i][1]
				end
			end
			

			for j in(1.. critical.length) do
				if tmpary[i][1] == critical[j]
				red << node(tmpary[i][1])
				end
			end

		end	
		
		save "Koncowy", "png"
	end		

end
#---------------------------------------------
#MAIN

grafarray = Array.new

print "Witaj. Podawaj tak dlugo nowe wezly jak tylko masz ochote!" +"\n" + "Gdy uznasz, ze wystarczy dodawania wpisz \"done\"." + "\n" + "Sposob wprowadzania to index czas poprzednik np \"2 3 1\" \nPrzy pierwszym wezle podaj tylko index oraz czas\n"

#Creating values
n = gets.chomp
while(n != "done")
	grafarray.push(nodevalues(n))
	n = gets.chomp
end


grafarray.each do |x|
	 x.print_node
	
end

checktroll(grafarray) 



grafarray.sort! { |a,b| a.index <=> b.index }
criticalnodes = ""

for i in (0... grafarray.length) do
	if grafarray[i].prev.length == 0 then #brak poprzednikow
		grafarray[i].est = 0
		grafarray[i].eet = grafarray[i].time
		criticalnodes = criticalnodes + "#{grafarray[i].index}"
	end
	if grafarray[i].prev.length == 1 then #jeden poprzednik
		previously = grafarray[i].prev.first.to_i #previously = grafarray[i].prev.first.to_i
		grafarray[i].est = grafarray[previously-1].eet
		grafarray[i].eet = grafarray[i].est + grafarray[i].time
		criticalnodes = criticalnodes + "#{grafarray[previously-1].index}" #criticalnodes = criticalnodes + "#{grafarray[i].index}"
	end

	if grafarray[i].prev.length > 1 then #wiecej poprzednikow
		
		indmax = 0
		for j in (0...grafarray[i].prev.length) do
			indpom = grafarray[i].prev[j]-1
			if grafarray[indpom].eet > grafarray[indmax].eet
				indmax = indpom
			end
		end
		grafarray[i].est = grafarray[indmax].eet
		criticalnodes = criticalnodes + "#{grafarray[indmax].index}"
		grafarray[i].eet = grafarray[i].est + grafarray[i].time
	end

end


# Add last node to the critical nodes list:
criticalnodes = criticalnodes + "#{grafarray.length}"
# Get the latest node's EET
criticaltime = grafarray.last.eet
# Leave only unique nodes in an array of integers
criticalnodes = criticalnodes.chars.map(&:to_i).uniq

puts "\n\n"
puts "#{criticalnodes}"
puts "\n\n"

makepngend(grafarray, criticalnodes) 



#END 

