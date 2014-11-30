module ApplicationHelper

def timeConverter(utcTimeStamp)
	time = DateTime.parse(utcTimeStamp)
	return time.strftime('%b %d %Y at %I:%M %p UTC')
end


def score_valid
 if score < 0 or score > 10
   errors.add_to_base("Score input is only valid between 0 to 10")
 end
end

end
