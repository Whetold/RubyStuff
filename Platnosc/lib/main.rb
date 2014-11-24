require_relative 'platnosc.rb'

print "Podaj kwote plus walute do przeliczenia platnosci paypal, oraz w jakiej walucie bedzie odbywana transakcja(pln,eur,usd,gbp,sek)\n"
values = Array.new
values = gets.chomp.split(' ')

values[1]=values[1].upcase
values[2]=values[2].upcase
a = Paypal.new
a.valuessetup(values)

a.checkifpossibletoexchange
case values[1]
when "PLN"
	case values[2]
		when "SEK"
		a.exchange(a.fpln2sek)
		when "EUR"
		a.exchange(a.fpln2eur)
		when "USD"
		a.exchange(a.fpln2usd)
		end
when "EUR"
	case values[2]
		when "SEK"
		a.exchange(a.feur2sek)
		when "PLN"
		a.exchange(a.feur2pln)
		when "USD"
		a.exchange(a.feur2usd)
		end
when "USD"
	case values[2]
		when "SEK"
		a.exchange(a.fusd2sek)
		when "PLN"
		a.exchange(a.fusd2pln)
		when "EUR"
		a.exchange(a.fusd2eur)
		end				
when "SEK"
	case values[2]
		when "PLN"
		a.exchange(a.fsek2pln)
		when "EUR"
		a.exchange(a.fsek2eur)
		when "USD"
		a.exchange(a.fsek2usd)
		end

end




