var cbox = document.getElementById("cbox");

var inputP2 = document.getElementById("inputP2");
var inputP3 = document.getElementById("inputP3");

cbox.onclick = function () {
  if (cbox.checked) {
    inputP1.type = "text";
    inputP2.type = "text";
    inputP3.attributes.removeNamedItem("required");
    inputP3.value = "";
    inputP3.attributes.setNamedItem(document.createAttribute("disabled"));
  } else {
    inputP1.type = "password";
    inputP2.type = "password";
    inputP3.attributes.setNamedItem(document.createAttribute("required"));
    inputP3.attributes.removeNamedItem("disabled");
  }
};

var inputP1 = document.getElementById("inputP1");
var pwdH1 = document.getElementById("pwdH1");
var inputP2 = document.getElementById("inputP2");
var pwdH2 = document.getElementById("pwdH2");
var inputP3 = document.getElementById("inputP3");

var username = document.getElementById("navbarDropdownMenuLink").text;

inputP1.onchange = function () {
  pwdH1.value = sha256(username + "_" + inputP1.value);
};

inputP2.onchange = function () {
  pwdH2.value = sha256(username + "_" + inputP2.value);
};

document.getElementById("sForm").onsubmit = function () {
  if (cbox.checked) return true;
  else {
    var result = inputP2.value === inputP3.value;
    if (result === false) alert("密码不一致");
    return result;
  }
};
