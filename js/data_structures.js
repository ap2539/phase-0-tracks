var colors = ["teal","purple","black","blue"];
var horses = ["Jared","Ashley","Izzy","Grant"];

console.log(colors);
console.log(horses);

colors.push("green");
horses.push("Tommy");

console.log(colors);
console.log(horses);

var horse_list = {}
for (var i = 0; i < horses.length; i++) {
	horse_list[horses[i]] = colors[i];
	console.log(horse_list);
}

function Car(model, year, maintenance) {
	this.model = model;
	this.year = year;
	this.maintenance = maintenance;

	this.fix_car = function() {
		if (maintenance) {
			console.log("Fixed the car");
			this.maintenance = false;
		} else {
			console.log("Nothing to fix");
		}
	}
}

var car = new Car("Accord", 2016, true);
car.fix_car();
console.log(car);