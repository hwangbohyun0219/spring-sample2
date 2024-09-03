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
</style>
<body>
	<div id="app">

		<div>
			<select  v-model="si" @change="fnGetArea()">
				<option>::선택::</option>
				<option v-for="item in list" :value="item.si">{{item.si}}</option>
			</select>
		</div>

		
		
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				si: '',
				list:[]
            };
        },
        methods: {
			fnGetArea(){
				var self = this;
				var nparmap = {
					si : self.si
				};
				$.ajax({
					url:"area.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						
						
					}
				});
            },
			
        },
        mounted() {
			var self = this;
			self.fnGetArea();
        }
    });
    app.mount('#app');
</script>