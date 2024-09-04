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
		<ul>
			<li>
				<label>
					아이디 : 
					<input v-if="!isCheck"  type="text" id="id" v-model="info.id">
					<input v-else type="text" id="id" v-model="info.id">	
				</label>
			</li>
			<li>
				<button @click="fnGetJoinus()">아이디중복체크</button>
			</li>
			<li>
				<label>
					비밀번호 : 
					<input type="pwd" id="pwd" v-model="info.pwd">
					
				</label>
					비밀번호 확인 : 
					<input type="pwd" id="pwd" v-model="info.pwd">
			</li>
			<li>
				<label>
					핸드폰번호 : 
					<input type="text" id="phone" v-model="info.phone">
				</label>
			</li>
			
		</ul>
		
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				id:"",
				pwd:"",
				phone
				
            };
        },
        methods: {
			fnGetJoinus(){
				var self = this;
				$.ajax({
					url:"joinus.dox",
					dataType:"json",	
					type : "POST", 
					data : data,
					success : function(data) { 
						console.log(data);
					}
				});
            },
			
        },
        mounted() {
			var self = this;
			self.fnGetjoinus();
        }
    });
    app.mount('#app');
</script>