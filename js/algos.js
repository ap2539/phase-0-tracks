//method: get_longest
//input: takes an array of strings
//steps: intialize longestIndex variable to store the index of the longest length string, default to 0
//steps: for every index in the array
	//steps: compare the string length of the longest index to the length of the current index
	//steps: if the length of the longest index is less than the length of the current index
		//steps: set the longest length index to teh current index
		//steps: else do nothing
//Output: return the string value of the longestIndex


function get_longest(phraseArray) {
	var longestIndex = 0;
	for (var i = 0; i < phraseArray.length; i++) {
		if (phraseArray[longestIndex].length < phraseArray[i].length) {
			longestIndex = i;
		}
	}
	return phraseArray[longestIndex];
}

var array_of_phrases = ["long phrase", "long phrase","long phrase","longest phrase","longer phrase"];
console.log(get_longest(array_of_phrases));

array_of_phrases = ["One", "two", "three", "four", "five", "six", "seven"];
console.log(get_longest(array_of_phrases));

array_of_phrases = ["1", "12", "123", "1234", "1234567", "123456"];
console.log(get_longest(array_of_phrases));

