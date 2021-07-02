var pages = document.getElementById("pages");

var prev = document.getElementById("prevLink");

if (activeP === 1) prev.classList.add("disabled");
else prev.href = `?p=${activeP - 1}`;

document.getElementById("prevLink").children[0].href = `?p=${activeP - 1}`;

var start = -1;
if (activeP - 2 > 0) start = activeP - 2;
else if (activeP - 2 === 0) start = activeP - 1;
else start = activeP;

var end = -1;
if (totalP - activeP <= 0) end = totalP;
else if (totalP - activeP === 1) end = activeP + 1;
else if (totalP - activeP === 2) end = activeP + 2;
else if (totalP - activeP === 3) end = activeP + 3;
else end = activeP + 4;

if (end - start > 4) end = start + 4;

function initP() {
  for (var i = start; i <= end; i++) {
    var t = document.createElement("li");
    t.innerHTML = `<li class="page-item"><a class="page-link" href="?p=${i}">${i}</a></li>`;
    if (i === activeP) t.children[0].classList.add("active");
    pages.append(t);
  }
  var t = document.createElement("li");
  t.innerHTML = `<li class="page-item"><a class="page-link" href="#">下一页</a></li>`;
  if (end === activeP) t.children[0].classList.add("disabled");
  else t.children[0].children[0].href = `?p=${activeP + 1}`;
  pages.append(t);

  var t2 = document.createElement("li");
  t2.innerHTML = `<li class="page-item"><a class="page-link" href="?p=${totalP}">末页</a></li>`;
  pages.append(t2);
}

initP();
