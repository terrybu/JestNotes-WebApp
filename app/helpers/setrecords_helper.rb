module SetrecordsHelper
	def turnJokesArrayIntoOrderedString(jokesArray)

		resultArray = [];

		for i in 0..jokesArray.length-1
			joke = jokesArray[i];
			newString = "#{i+1}. #{joke}"
			resultArray << newString;
		end

		return resultArray.join(" ")
	end

	def turnJokesArrayIntoStringWithNewLines(jokesArray)

		resultArray = [];

		for i in 0..jokesArray.length-1
			joke = jokesArray[i];
			newString = "#{i+1}. #{joke}"
			resultArray << newString;
		end

		return resultArray.join("<br>").html_safe
	end


end
