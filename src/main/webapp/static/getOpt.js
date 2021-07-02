function getTbox() {
  return {
    // https://echarts.apache.org/examples/zh/editor.html?c=line-marker
    show: true,
    feature: {
      dataZoom: {
        yAxisIndex: "none",
      },
      dataView: { readOnly: true },
      magicType: {},
      saveAsImage: {},
    },
  };
}

function getOpt(type) {
  if (type === "line") {
    var tbox = getTbox();
    tbox.magicType = { type: ["line", "bar"] };
    return {
      // https://echarts.apache.org/examples/zh/editor.html?c=line-simple
      toolbox: tbox,
      xAxis: {
        type: "category",
      },
      yAxis: {
        type: "value",
      },
      series: [
        {
          data: [],
          type: "line",
        },
      ],
    };
  } else if (type === "reg")
    return {
      // https://echarts.apache.org/examples/zh/editor.html?c=scatter-linear-regression
      toolbox: getTbox(),
      dataset: [
        {
          source: [],
        },
        {
          transform: {
            type: "ecStat:regression",
            // 'linear' by default.
            // config: { method: 'linear', formulaOn: 'end'}
          },
        },
      ],
      tooltip: {
        trigger: "axis",
        axisPointer: {
          type: "cross",
        },
      },
      xAxis: {
        splitLine: {
          lineStyle: {
            type: "dashed",
          },
        },
      },
      yAxis: {
        splitLine: {
          lineStyle: {
            type: "dashed",
          },
        },
      },
      series: [
        {
          name: "scatter",
          type: "scatter",
        },
        {
          name: "line",
          type: "line",
          datasetIndex: 1,
          symbolSize: 0.1,
          symbol: "circle",
          label: { show: true, fontSize: 16 },
          labelLayout: { dx: -20 },
          encode: { label: 2, tooltip: 1 },
        },
      ],
    };
  else if (type === "pie")
    return {
      // https://echarts.apache.org/examples/zh/editor.html?c=pie-simple
      tooltip: {
        trigger: "item",
      },
      legend: {
        // top: "5%",
        left: "center",
      },
      series: [
        {
          type: "pie",
          radius: "50%",
          data: [],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: "rgba(0, 0, 0, 0.5)",
            },
          },
        },
      ],
    };
  else if (type === "wordcloud")
    return "https://www.makeapie.com/editor.html?c=xBGq7gnHzU";
}
