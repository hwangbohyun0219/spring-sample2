<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table, tr, th, td{
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px 5px;
	}
	
	
</style>
<body>
	<div id="app">
		<table>
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>가격</th>
			<th>종류</th>
		</tr>	
			<tr v-for= "item in list">
				<td>{{item.itemNo}}</td>
				<td>{{item.itemName}}</td>
				<td @click=fnUpdate()>{{item.price}}</td>
				<td>{{item.codeName}}</td>
			</tr>
		</table>
		
		
		
		<button>클릭</button>
		
		
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				list : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"emp1.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            },
			
			fnApi(){
				var xhr = new XMLHttpRequest();
				var url = 'https://www.kdhc.co.kr:443/openapi-data/service/kdhcEnergy/energy'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'zK%2Byjv9qIjJhVe2f7BR98QsPN4iTGb20C7fZCcnDpw6R2%2BatacukXZQB0XtlWUfKCDKkKnsrJXggGt2yS0CFhw%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('20'); /**/
				queryParams += '&' + encodeURIComponent('startDate') + '=' + encodeURIComponent('201006'); /**/
				queryParams += '&' + encodeURIComponent('endDate') + '=' + encodeURIComponent('201007'); /**/
				xhr.open('GET', url + queryParams);
				xhr.onreadystatechange = function () {
				    if (this.readyState == 4) {
				        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
				    }
				};

				xhr.send('');
			}
			
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>