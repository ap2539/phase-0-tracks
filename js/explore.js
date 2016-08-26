
//intiate index as the length of the string
//for each index starting from end of the string until the index is >= 0
	//store the string[index] to a new string variable
	//subtract 1 from the index
//print the string variable

function reverseString(inputString) {
	//intialize the string to store the reversed input
	var reversed_string = "";

	//set the index = length of string and reduce it for every iteration
	//This makes it so that you start at the end of the string and move backwards
	for (var i = inputString.length-1; i >= 0; i--)
	{
		//call the index for the string and store it to the variable
		reversed_string += inputString[i];
	}

	return reversed_string;
}

//driver code
var driverString = "This is a test";
var printString = "";

//true case test
if (1==1) {
	printString = reverseString(driverString);
}

//false case test
//if (1==2) {
//	printString = reverseString(driverString);
//}

//print the results
console.log(printString);




