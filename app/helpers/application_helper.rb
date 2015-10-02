module ApplicationHelper
	def russianize(number)
		if number == 1
			return ""
		elsif number == 2..4
			return "а"
		else
			return 'ов'
		end
	end
end
