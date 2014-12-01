#!/usr/bin/env ruby
class Paypal < Array

def valuessetup(arr)
	for i in (0..arr.length-1) do
		self[i] = arr[i]		
	end
	
	return self
end

def checkifpossibletoexchange
	typesofcur=["PLN", "EUR","USD", "SEK"]
	for i in (0..typesofcur.length-1) do 
	
	if self[2] == typesofcur[i] then
		return true 
	else
		return false
	end

end
end 
def printexchange(exchanged)
puts "\n#{self[1]} #{self[0]} in #{self[2]} is #{exchanged}" 


end
def exchange(multip)
exchanged = (self[0].to_f * multip).round(2)

return exchanged
end
def printsendmoneyinter
	fee = international
	puts "podatek: #{fee}"
end
def printsendmoneycountry
	fee = country
	puts "podatek: #{fee}"
end

def international 
self[0] = 	((self[0].to_f * 4 ) / 100 ).round(2)
self[0] +=  1.35
return self[0]
end

def country

self[0] = ((self[0].to_f * 2 ) / 100 ).round(2)
self[0] += 0.80
return self[0]

end
def fpln2eur
return 0.228693
end
def fpln2usd
return 0.287966
end
def fpln2sek
return 2.14964
end

def feur2pln
return 4.08094		
end
def feur2usd
return 1.20709
end
def feur2sek
return 9.01087
end

def fusd2pln
return 3.29627
		
end
def fusd2eur
return  0.786412
end
def fusd2sek
return  7.27829
end

def fsek2pln
return 0.441064

end
def fsek2usd
return  0.130461
end
def fsek2eur
return 0.105227
end




end
