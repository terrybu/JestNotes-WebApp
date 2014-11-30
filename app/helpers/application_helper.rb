module ApplicationHelper

def timeConverter(utcTimeStamp)
	time = DateTime.parse(utcTimeStamp)
	return time.strftime('%b %d %Y at %I:%M %p UTC')
end

end

