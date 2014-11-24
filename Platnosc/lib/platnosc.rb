#!/usr/bin/env ruby

def valuessetup
	print "Podaj kwote plus walute do przeliczenia platnosci paypal. (pln,eur,usd,gbp,sek)\n"
	x = gets.upcase.chomp
	x.gsub(/\s+/m, ' ').strip.split(" ") do |argument| #many white spaces and m is modifier
	values << argument
	

	return values
end

end

def paymentstartup(cur)
	typesofcur=["PLN", "EUR","USD","GBP", "SEK"]

	tocalc = []
	for i in (0..typesofcur.length-1) do
		if typesofcur[i] != cur
			tocalc << typesofcur[i] 
			
		end
	end
return tocalc
end

def exchange(excur, maincur)

	for i in (0.. excur.length-1) do	
	
		exchanged = (maincur[0].to_f * exchangeratevalue(excur[i], maincur[1])).round(2)	
		puts "\nIn #{excur[i]} it's #{exchanged}" 
		
	end



end 
def exchangeratevalue(excur, maincur)

	case maincur
	when "PLN"   #when we exchange from pln
		case excur
			when "EUR"
			multipler = 0.228693
			when "USD"
			multipler = 0.287966
			when "GBP"
			multipler = 0.183993
			when "SEK"
			multipler = 2.14964
		end
	when "EUR"
		case excur
			when "PLN"
			multipler = 4.08094
			when "USD"
			multipler = 1.20709
			when "GBP"
			multipler = 0.771263
			when "SEK"
			multipler = 9.01087
		end 
	when "USD"
		case excur
			when "EUR"
			multipler = 0.786412
			when "PLN"
			multipler = 3.29627
			when "GBP"
			multipler = 0.622967
			when "SEK"
			multipler = 7.27829
		end
	when "GBP"
		case excur
			when "EUR"
			multipler = 1.22940
			when "USD"
			multipler = 1.52422
			when "PLN"
			multipler = 5.15307
			when "SEK"
			multipler = 11.3781
			end
	when "SEK"
		case excur
			when "EUR"
			multipler = 0.105227
			when "USD"
			multipler = 0.130461
			when "GBP"
			multipler = 0.0833574
			when "PLN"
			multipler = 0.441064
			end
	end
return multipler
end

values = valuessetup
exchange(paymentstartup(values[1]), values)



