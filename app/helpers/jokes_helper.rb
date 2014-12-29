module JokesHelper


def lengthConverter(seconds)
	minutes = seconds/60
	leftoverSecs = seconds % 60
	
	if (minutes == 0)
		return "#{leftoverSecs} secs"
	elsif (minutes == 1)
		return "#{minutes} min #{leftoverSecs} secs"
	end

	return "#{minutes} mins #{leftoverSecs} secs"
end


end
