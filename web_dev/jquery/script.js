console.log("The script is running!");
$( "button:first" ).click(function() {
  $( "#lizard-photo" ).animate({opacity: 0.1 },1000)});

$( "button:last" ).click(function() {
  $( "#lizard-photo" ).animate({opacity: 100 },1000)});

//The above lines of code replace the lines of code below
//They also add additional fucntionality by allowing the picture to fade


//function camouflage(event) {
//  var photo = document.getElementById("lizard-photo")
//  if (event.target.textContent == "See it blend in!") {
//  	photo.style.visibility = "hidden";
//  }
//  else {
//  	photo.style.visibility = "visible";
//  }  
//}

//var button = document.getElementsByTagName("button");
//button[0].addEventListener("click", camouflage);
//button[1].addEventListener("click", camouflage);

//$( "button:first" ).click(function() {
//  $( "p:first" ).fadeToggle( "slow", "linear" );
//});