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