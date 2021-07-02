var tbody = $("tbody")[0];

function init() {
  var L = tbody.children;
  for (var i = 0; i < L.length; i++) {
    var td1 = L[i].children[0];
    var dirty = Base64.decode(td1.textContent);
    // td1.textContent = DOMPurify.sanitize(dirty);
    td1.textContent = dirty;
    var td2 = L[i].children[1];
    var id = td2.textContent;
    td2.innerHTML = `
    <a target=\"_blank\" class=\"btn btn-secondary\" href=\"edit.jsp?id=${id}\">编辑</a>
    <a class=\"btn btn-secondary\" href=\"DeleteArticle?id=${id}\">删除</a>`;
  }
}

init();
