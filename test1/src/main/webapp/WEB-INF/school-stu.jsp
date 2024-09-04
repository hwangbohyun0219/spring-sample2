<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>view 기본 세팅 파일</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</head>
<style>
	.pagination {
		    justify-content: center;
		    align-items: center;
		    margin: 20px 0;
		}
		.pagination button {
		    background-color: #f8f9fa;
		    border: 1px solid #dee2e6;
		    color: #007bff;
		    padding: 8px 12px;
		    margin: 0 2px;
		    cursor: pointer;
		    transition: background-color 0.3s, color 0.3s;
		    border-radius: 4px;
		}

		.pagination button:hover {
		    background-color: #007bff;
		    color: white;
		}

		.pagination button.active {
		    background-color: #007bff;
		    color: white;
		    cursor: default;
		}

		.pagination button:disabled {
		    background-color: #e9ecef;
		    color: #6c757d;
		    cursor: not-allowed;
		    border: 1px solid #dee2e6;
		}

		.pagination button:not(.active):not(:disabled):hover {
		    background-color: #0056b3;
		    color: white;
		}
</style>
<body>
	<div id="app">
		<i class="fa-solid fa-money-check-dollar"></i>
		<span class="material-symbols-outlined">
			home
		</span>
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
		
		<div>
			<select v-model="selectSize" @change="fnGetList(1)">
				<option value="5">5개씩</option>
				<option value="10">10개씩</option>
				<option value="15">15개씩</option>
			<select>			
		</div>
		
		<div class="pagination">
		    <button v-if="currentPage > 1">이전</button>
		    <button v-for="page in totalPages" :class="{active: page == currentPage}" @click="fnGetList(1)">
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages">다음</button>
		</div>
		
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list:[],
				currentPage : 1,
				pageSize : 10,
				totalPages : 1,
				selectSize : 5
            };
        },
        methods: {
			fnGetList(page){
				var self = this;
				self.pageSize = self.selectSize;
				var currentPage = (page - 1) * self.pageSize;
				self.selectSize = self.selectSize;
				var pageSize = self.pageSize;
				var nparmap = {
					currentPage : self.currentPage,
					pageSize : pageSize
				};
				$.ajax({
					url:"SchoolStu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.list);
						self.list = data.list;
						self.currentPage = page;
						self.totalPages = Math.ceil(data.count / self.pageSize);
						
						
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
			self.fnGetList(1);
			
        }
    });
    app.mount('#app');
</script>