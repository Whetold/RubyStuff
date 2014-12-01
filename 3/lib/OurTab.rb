require_relative 'Qsort.rb'
#Github doesn't want to change indent size
class OurTab < Array
	include Qsort

	def setS(tab)
		for i in (0...tab.length) do
			self[i] = tab[i]
			end
		return self
	end 

end
