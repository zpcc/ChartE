var unInput = document.getElementById("unInput");
var pwdInput = document.getElementById("pwdInput");
var unH = document.getElementById("unH");
var pwdH = document.getElementById("pwdH");

unInput.onchange = function () {
  unH.value = unInput.value;
};

pwdInput.onchange = function () {
  pwdH.value = sha256(unInput.value + "_" + pwdInput.value);
};
