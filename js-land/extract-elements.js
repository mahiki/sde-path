// this will pull user name and points from Merlin rankings page

var users = document.getElementsByClassName("udetails");
for (var i = 0; i < users.length; i++) {
var lines = users[i].innerText.split('\n');
console.log(lines[0] + '\t' + lines[1])
}