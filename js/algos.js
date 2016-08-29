//method: get_longest
//input: takes an array of strings
//steps: intialize longestIndex variable to store the index of the longest length string, default to 0
//steps: for every index in the array
	//steps: compare the string length of the longest index to the length of the current index
	//steps: if the length of the longest index is less than the length of the current index
		//steps: set the longest length index to teh current index
		//steps: else do nothing
//Output: return the string value of the longestIndex


//method: does_match
//input: takes 2 hash objects
//steps: intialize 2 arrays one for each hash and default a boolean to false
//steps; split the hashs up to an array of values
//steps: loop through the first array
	//steps: if the second array includes a value from teh first array 
		//Steps: set match = true
//output: boolean

//method: random_word
//input: integer -> array size
//Steps: for each value in array size
	//push and random word to new array
//output: new array


function get_longest(phraseArray) {
	var longestIndex = 0;
	for (var i = 0; i < phraseArray.length; i++) {
		if (phraseArray[longestIndex].length < phraseArray[i].length) {
			longestIndex = i;
		}
	}
	return phraseArray[longestIndex];
}

function does_match(first_hash,second_hash) {
	var first_array_values = new Array();
	var second_array_values = new Array();
	var match = false;

	//refactor this section to a seperate function
	for (var key in first_hash) {
    	first_array_values.push(first_hash[key]);
	}
	for (var key in second_hash) {
    	second_array_values.push(second_hash[key]);
	}

	//loop through the first array and compare against the second array for matches
	for (var i=0; i < first_array_values.length; i++) {
		if (second_array_values.includes(first_array_values[i])) {
			match = true;
		}
	}
	return match;
}

var array_of_phrases = ["long phrase", "long phrase","long phrase","longest phrase","longer phrase"];
console.log(get_longest(array_of_phrases));

array_of_phrases = ["One", "two", "three", "four", "five", "six", "seven"];
console.log(get_longest(array_of_phrases));

array_of_phrases = ["1", "12", "123", "1234", "1234567", "123456"];
console.log(get_longest(array_of_phrases));

var hash_of_data = {name: "Steven", age: 54};
var hash_of_data2 = {name: "Alex", age: 54};
console.log(does_match(hash_of_data,hash_of_data2));

hash_of_data = {name: "Steven", age: 20};
hash_of_data2 = {name: "Alex", age: 54};
console.log(does_match(hash_of_data,hash_of_data2));

var int = 20;
