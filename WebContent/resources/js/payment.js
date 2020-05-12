

function kakaoPay(){
	document.getElementById('paymodal').style.display = "none";
	
	var contribution = $("#contribution").val();
	var organization_name = $("#organization_name").val();
	var nickname = $("#nickname").val();
	var program_subject = $("#program_subject").val();
	var organization_id = $("#organization_id").val();
	var program_id = $("#program_id").val();
	
	//난수만들기 
	const today = new Date();
	const ms = today.getMilliseconds();
	var a = Math.floor(Math.random() * 1000) + 1;
	var currentOrder_id = ms+"_"+a;
	
	if(contribution == ""){
		alert("기부 금액을 입력해 주세요");
	}else{
		//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
		BootPay.request({
			price: contribution, //실제 결제되는 가격
			application_id: "59a4d323396fa607cbe75de4",
			name: organization_name, //결제창에서 보여질 이름
			pg: 'kakao', //'payapp'-네이버 일시 
			method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
			
			//네이버에서 필요 
			user_info: { //우리 쪽 db에서 작업 
				username: nickname
			},
			order_id: currentOrder_id, //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
			
		}).error(function (data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log(data);
		}).cancel(function (data) {
			//결제가 취소되면 수행됩니다.
			console.log(data);
		}).confirm(function (data) {
			//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
			//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
			//alert("재고");
			console.log(data);
			var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
			if (enable) {
				BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
			} else {
				BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
			}
		}).close(function (data) {
		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
		    console.log(data);
		}).done(function (data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
			 $.ajax({
			   		type:"get"
			   		,url:"payment.do?contribution="+contribution+"&organization_name="+organization_name+"&program_subject="+program_subject+"&organization_id="+organization_id+"&program_id="+program_id	 
			   		,dataType:"json"})
			   		.done(function(args){
			   			//console.log("payment 들어오니?");
			   			alert("함께해주셔서 감사합니다. \n기부가 완료되었습니다!");
			   			
			   			if(args.num == 10){
			   				alert("따뜻한 마음 함께해요!\nLv.1 등급이 되셨습니다.");
			   			}else if(args.num == 50){
			   				alert("함께 희망을 전해요!\nLv.2 등급이 되셨습니다.");
			   			}else if(args.num == 100){
			   				alert("늘 함께 응원해주셔서 감사합니다.\nLv.3 등급이 되셨습니다.");
			   			}
			   			var idx = $("#user_idx").val()
			   			/*alert("idx : " + idx);*/
			   			if(idx){
			   				window.open("registerComment.do?organization_id="+organization_id+"&program_id="+program_id, '_blank', 'width=700. height=400');
			   			}else if(!idx){
			   				location.reload();
			   			}
			   			//location.reload();
			   		})
			   		.fail(function(e) {
			   			alert("error");
			   			alert(e.responseText);
			   		});
			
			console.log(data);
		});
	}
	
}
