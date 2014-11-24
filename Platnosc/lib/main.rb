require_relative 'platnosc.rb'

print "1 by przeliczyc platnosc.\n2 by przeliczyc podatek przy wysylaniu pieniedzy\n"
menu = gets.chomp.to_i

case menu
	when 1
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
	when 2
	print "Podaj kwote oraz drugi argument\n1 jezeli wysylanie w kraju lub 2 jezeli miedzynarowodwe\n"
	values = Array.new
	values = gets.chomp.split(' ')

	values[1]=values[1]
	values[2]=values[2]
	b = Paypal.new
	b.valuessetup(values[1])
	if values[2] == 2 then
	b.printsendmoneyinter
	else
	b.printsendmoneycountry
	end
end
