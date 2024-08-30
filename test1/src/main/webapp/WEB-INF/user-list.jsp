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
		<button @click="fnBoardList">게시글목록(userController에서 작성)</button>
		
		<div>
			<select v-model="searchOption">
				<option value="all">:: 전체 ::</option>
				<option value="id">아이디</option>
				<option value="email">이메일</option>
			</select>
			<input placeholder="검색" v-model="keyword">
			<button @click="fnUserList">검색</button>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in userList">
				<td>{{item.userId}}</td>
				<td><a href="#" @click="fnUserView(item.userId)">{{item.userName}}</a></td>
				<td>{{item.email}}</td>
				<td><button @click="fnRemove(item.userId)">삭제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList : [],
				keyword : "",
				searchOption : "all"
            };
        },
        methods: {
			fnUserList(){
				var self = this;
				var nparam = {
					keyword : self.keyword,
					searchOption : self.searchOption
				};
				$.ajax({
					url:"user-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						console.log(data);	
						self.userList = data.list;
					}
				});
			},
			fnBoardList(){
				var self = this;
				var nparam = {};
				$.ajax({
					url:"boardList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparam,
					success : function(data) { 
						console.log(data);	
					}
				});
			},
			fnRemove(userId) {
				console.log(userId);
				// user-remove.dox 호출해서 해당 아이디 가진 레코드 삭제
				var self = this;
				var nparam = {userId : userId};
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
						self.fnUserList();
					}
				});
			},
			fnUserView (userId){
				$.pageChange("user-view.do", {userId : userId});
			}
        },
        mounted() {
			var self = this;
			self.fnUserList();
        }
    });
    app.mount('#app');
</script>