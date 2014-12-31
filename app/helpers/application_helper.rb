module ApplicationHelper

	def timeConverter(utcTimeStamp)
		time = DateTime.parse(utcTimeStamp)
		return time.strftime('%b %d %Y at %I:%M %p UTC')
	end

	def writeTimeConverter(date)
		if (date)
			return date.strftime('%Y-%m-%d')
		else 
			return nil
		end
	end

end

