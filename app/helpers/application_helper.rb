module ApplicationHelper

def timeConverter(utcTimeStamp)
	time = DateTime.parse(utcTimeStamp)
	return time.strftime('%b %d %Y at %I:%M %p UTC')
end

def writeTimeConverter(date)
	return date.strftime('%Y-%m-%d')
end

end

