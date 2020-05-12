		function checkAll2(){
		if (!checkDate(form2.date.value)) {
            return false;
        }
        if (!checkOrganization_name(form2.organization_name.value)) {
        	return false;
        }
        if (!checkProgram_name(form2.program_name.value)) {
            return false;
        }
        if (!checkContribution(form2.contribution.value)) {
            return false;
        }      
		if (!checkSubject(form2.subject.value)) {
            return false;
        }
        if (!checkContent(form2.content.value)) {
            return false;
        }  
        return true;
    }
	
    // 공백확인 함수
    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }
 
    function checkOrganization_name(organization_name) {
        //기관명이 입력되었는지 확인하기
        if (!checkExistData(organization_name, "기관명을")){
        	form.organization_name.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
    
    function checkProgram_name(program_name) {
        //프로그램명이 입력되었는지 확인하기
        if (!checkExistData(program_name, "프로그램명을")){
        	form.program_name.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
    
    function checkContribution(contribution) {
        //기부금액이 입력되었는지 확인하기
        if (!checkExistData(contribution, "기부금액을")){
        	form.contribution.focus();
            return false;
        }      
        //0부터 시작시 0을 지움
        var contributionRegExp = value.replace(/^[0]|[^0-9,]/g, ''); //비밀번호 유효성 검사
        if (!contributionRegExp.test(contribution)) {
            return false;
        }        
        return true; //확인이 완료되었을 때
    }
    
    function checkDate(date) {
        if(!date) {
        	alert("날짜를 입력해주세요!");
        	return false;
        }
        return true; //확인이 완료되었을 때
    }

    