
echarts.registerTransform(ecStat.transform.regression);

var myChart = echarts.init(document.getElementById("chartDiv"));

// document.getElementById("editor").innerHTML = dirty;

window.addEventListener("resize", function () {
  myChart.resize();
});

function preview() {
  var jsonObj = JSON.parse(Base64.decode(jsonstr));
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
  myChart.resize();
}

preview();
