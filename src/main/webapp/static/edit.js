echarts.registerTransform(ecStat.transform.regression);

if (b64str === "null") b64str = "";

if (b64str) var jsonstr = Base64.decode(b64str);
else {
  var jsonstr = `{
    "type": "line",
    "data": [
      ["示例数据1", 70],
      ["X2", 100],
      [3, 30],
      [4, 80]
    ]
}`;
}

if (isPub === "true") document.getElementById("cBox").checked = true;
else document.getElementById("cBox").checked = false;

var chartDiv = document.getElementById("chartDiv");
var myChart = echarts.init(chartDiv);

var dataH = document.getElementById("dataH");
var editorDiv = document.getElementById("editor");

// document.getElementById("editor").innerHTML = dirty;

ace.config.set(
  "basePath",
  "https://cdn.jsdelivr.net/npm/ace-builds@1.4.12/src-noconflict/"
);

var editor = ace.edit("editor", {
  autoScrollEditorIntoView: true,
  maxLines: 20,
  minLines: 15,
  mode: "ace/mode/json",
});

editor.setValue(jsonstr);

dataH.value = editor.getValue();

editor.getSession().on("change", function () {
  dataH.value = editor.getValue();
});

window.addEventListener("resize", function () {
  myChart.resize();
});

document.getElementById("preview").onclick = preview;

function preview() {
  var jsonObj = JSON.parse(editor.getValue());
  var type = jsonObj["type"];
  var option = getOpt(type);
  if (type === "line") {
    option.series[0].data = jsonObj["data"];
  } else if (type === "reg") {
    option.dataset[0].source = jsonObj["data"];
  } else if (type === "pie") {
    option.series[0].data = [];
    for (var i = 0; i < jsonObj["data"].length; i++) {
      var item = { value: jsonObj["data"][i][1], name: jsonObj["data"][i][0] };
      option.series[0].data.push(item);
    }
  }
  console.log(option);
  myChart.setOption(option);
  chartDiv.parentElement.style.height = editorDiv.style.height;
  myChart.resize();
}

if (isMine !== "true") document.getElementById("form").remove();
