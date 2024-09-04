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
			<input placeholder="주소">
			<button @clilk=fnSearchAddr()>주소</button>
		</div>

		
		
		
	</div>
</body>
</html>
<script>
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		if (window.vueAppInstance) {
			window.vueAppInstance.fnResult(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo);
		} else {
			console.error("Vue app instance is not available.");
		}
	}
	
    const app = Vue.createApp({
        data() {
            return {
				list:[]
            };
        },
        methods: {
			fnSearchAddr(){
				var self = this;
				var option = "width = 500, height = 500, top = 100, left = 200, location = no"
					window.open("addr.do", "addr", option);
				var nparmap = {
					
				};
				$.ajax({
					url:"address.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						
						
					}
				});
            },
			fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				var self = this;
				self.roadFullAddr = roadFullAddr;
				// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
				console.log(roadFullAddr);
				console.log(roadAddrPart1);
				console.log(addrDetail);
				console.log(engAddr);
			},
			
        },
        mounted() {
			var self = this;
			self.fnSearchAddr();
			window.vueAppInstance = this;
        }
    });
    app.mount('#app');
</script>