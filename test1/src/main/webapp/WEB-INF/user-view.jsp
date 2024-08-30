<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>user 리스트 출력</title>
</head>
<style>
	table, div {
			margin : 20px;
	}
	table, tr, th, td {
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse: collapse;
	}
	
</style>
<body>
	<div id="app">
		<div>이름 : {{info.userName}}</div>
		<div>아이디 : {{info.userId}}</div>
		<div>이메일 : {{info.email}}</div>
		<button @click="fnRemove">삭제</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId : '${userId}',
				info : {}
            };
        },
        methods: {
			fnUserView(){
				var self = this;
				var nparam = {userId : self.userId};
				$.ajax({
					url:"idCheck.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						console.log(data);	
						self.info = data.info;
					}
				});
			},
			fnRemove() {
				var self = this;
				var nparam = {userId : self.userId};
				if(!confirm("삭제하시겠습니까?")){
					return;
				};
				$.ajax({
					url:"user-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						alert("삭제되었습니다.");
						$.pageChange("user-list.do", {});
					}
				});
			}
        },
        mounted() {
			var self = this;
			self.fnUserView();
        }
    });
    app.mount('#app');
</script>