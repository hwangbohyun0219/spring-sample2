<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>아이디</th>
				<th>학년</th>
				<th>주소</th>
				<th>삭제<th>
				
			</tr>
			<tr v-for="item in list">
				<td>{{item.stuNo}}</td>
				<td><a href="#" @click="fnView(item.stuNo)">{{item.name}}</a></td>
				<td>{{item.id}}</td>
				<td>{{item.grade}}</td>
				<td>{{item.jumin}}</td>
				<td>
						<button  @click="fnRemove(item.stuNo)">삭제</button>
				</td>
			</tr>	
		</table>
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list:[]

            };
        },
        methods: {
			fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"SchoolStu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.stuList);
						self.list = data.stuList;
					}
				});
            },

			fnRemove(num) {
				
				if(confirm("gd")){
					console.log("num : " + num);
									var self = this;
									var nparmap = {
										stuNo : num
									};
								$.ajax({
									url:"/Schooldelete.dox",
									dataType:"json",	
									type : "POST", 
									data : nparmap,
									success : function(data) { 
										console.log(data);
										alert(data.message);
										self.fnGetList();
									}
								});
				}
				
			}
			
			
        },
        mounted() {
			var self = this;
			self.fnGetList();
			
        }
    });
    app.mount('#app');
</script>