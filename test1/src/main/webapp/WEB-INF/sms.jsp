<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<button v-if="inputFlg" @click="fnSmsTest">문자인증</button>
			<input v-if="!inputFlg" :placeholder="timer" type="text" v-model="inputNumber">
			{{timer}}
			<button v-if="!inputFlg" @click="fnAuth">인증</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	number : "", // 랜덤 인증 숫자
    	inputNumber : "", // 사용자 입력 숫자
    	inputFlg : true,
    	count : 180,
    	timer : ""
    }   
    , methods: {
    	fnUpdate : function(){
            location.href="/user/edit.do";
        },
        fnBoard : function(){
            location.href="/boardList.do";
        },
        fnSmsTest : function(){
        	var self = this;
            var nparmap = {};
            $.ajax({
                url:"send-one",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.response.statusCode == "2000"){
                		alert("문자전송완료");
                		self.number = data.number;
                		self.inputFlg = false;
                		setInterval(self.fnTimer, 1000);
                	} else {
                		alert("문자전송실패");
                	}
                }
            }); 
        },
        fnAuth : function(){
        	var self = this;
        	if(self.number == self.inputNumber){
        		alert("인증성공!");
				$.pageChange("board-list.do", {});
        	} else {
        		alert("인증실패!");
        	}
        },
        fnTimer : function(){
        	var self = this;
        	var minutes, seconds;
        	minutes = parseInt(self.count / 60, 10);
        	seconds = parseInt(self.count % 60, 10);
        	
        	minutes = "0" + minutes;
        	seconds = seconds < 10 ? "0" + seconds : seconds;
        		
        	self.timer = minutes + " : " + seconds;
        	if(--self.count < 0){
        		alert("시간초과");
        		self.count = 180;
        		location.reload(true);
        	}
        }
        
    }   
    , created: function () {
    	var self = this;
	}
});
</script>