<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/layout/menu.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div id="chart">
      <apexchart type="area" height="350" :options="chartOptions" :series="series"></apexchart>
    </div>	  
		  
</div>
</body>
</html>

<script>
	
var app = new Vue({
	el : '#app',
	components: {
      apexchart: VueApexCharts,
    },
	data : {
		series: [{
            name: "test",
            data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
        }],
        chartOptions: {
          chart: {
            height: 350,
            type: 'area',
            zoom: {
              enabled: false
            }
          },
          dataLabels: {
            enabled: false
          },
          stroke: {
            curve: 'straight',
            colors : '#ff0000'
          },
          title: {
            text: 'test',
            align: 'center'
          },
          grid: {
            row: {
              colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
              opacity: 0.5
            },
          },
          xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
          }
        }
	},// data
	methods : {
		fnGetList(){
			var self = this;
			var nparmap = {
			};
			$.ajax({
				url:"/chart.dox",
				dataType:"json",	
				type : "POST", 
				data : nparmap,
				success : function(data) { 
					console.log(data);
					var priceList = [];
					for(var i=0; i<data.list.length; i++){
						priceList.push(data.list[i].price);
						dataList.push(data.list[i].pDate);
					}
					
					//self.series[0].data = priceList;
					//console.log(self.series);
					
					self.fnChart(priceList, dataList);
					
				}
			});
        },
		
		fnChart(priceList, dataList){
					var self = this;
					self.series=  [{
			            name: "test",
			            data: priceList
			        }]
			        self.chartOptions = {
			          chart: {
			            height: 350,
			            type: 'area',
			            zoom: {
			              enabled: false
			            }
			          },
			          dataLabels: {
			            enabled: false
			          },
			          stroke: {
			            curve: 'straight'
			          },
			          title: {
			            text: 'test',
			            align: 'center'
			          },
			          grid: {
			            row: {
			              colors: ['#f3f3f3', 'transparent'], 
			              opacity: 0.5
			            },
			          },
			          xaxis: {
			            categories: dataList,
			          }
			        }
				}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});


</script>