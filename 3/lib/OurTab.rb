require_relative 'Qsort.rb'

class OurTab < Array
	include Qsort

	def setS(tab)
		for i in (0...tab.length) do
			self[i] = tab[i]
			end
		return self
	end 

end
