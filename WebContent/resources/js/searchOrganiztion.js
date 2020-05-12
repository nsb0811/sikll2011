
//검색을 클릭하면 자싱창을띄어줌
function searchCheck(){
	$("#search_check_type").val(1);
	var nanmmByNm =$("#nanmmbyNm").val();
	
	var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=yes,height=500,width=500,left=0,top=0';
  
	 
	window.open('searchOrganiztion.do?nanmmByNm='+nanmmByNm,'자식창입니다',settings)
	
}
//자식창에서 부모창으로 정보넘김
function sendToParent(nanmmbyId,nanmmbyNm,rprsntvNm,fondDe,dmstcTelno,fxnum,adres,zip,hmpadres,bizrno){	
	
	var nanmmbyId1= document.getElementById(nanmmbyId).value;
	var nanmmbyNm1=document.getElementById(nanmmbyNm).value;
	var rprsntvNm1=document.getElementById(rprsntvNm).value;
	var fondDe1 =document.getElementById(fondDe).value;
	var dmstcTelno1 =document.getElementById(dmstcTelno).value;
	var fxnum1=document.getElementById(fxnum).value;
	var adres1=document.getElementById(adres).value;
	var zip1=document.getElementById(zip).value;
	var hmpadres1=document.getElementById(hmpadres).value;
	var bizrno1=document.getElementById(bizrno).value;
	
	opener.document.getElementById("nanmmbyId").value =nanmmbyId1;
	opener.document.getElementById("nanmmbyNm").value=nanmmbyNm1;
	opener.document.getElementById("rprsntvNm").value=rprsntvNm1;
	opener.document.getElementById("fondDe").value=fondDe1;
	opener.document.getElementById("dmstcTelno").value=dmstcTelno1;
	opener.document.getElementById("fxnum").value=fxnum1;
	opener.document.getElementById("adres").value=adres1;
	opener.document.getElementById("zip").value=zip1;
	opener.document.getElementById("hmpgAdres").value=hmpadres1;
	opener.document.getElementById("bizrno").value=bizrno1;

	self.close();    

}

