console.log("The script is running!");

function camouflage(event) {
  var photo = document.getElementById("lizard-photo")

  if (event.target.textContent == "See it blend in!") {
  	photo.style.visibility = "hidden";
  }
  else {
  	photo.style.visibility = "visible";
  }
  
}

var button = document.getElementsByTagName("button");
button[0].addEventListener("click", camouflage);
button[1].addEventListener("click", camouflage);