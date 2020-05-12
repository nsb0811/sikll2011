package contribution.model;

import java.util.Date;

public class GroupUserCommand {

	String user_id;
	String password;
	String name; 
	String organization_id;// 등록번호
	String nanmmByNm;// 모집단체명
	String rprsntvNm;// 대표자명
	String fondDe;// 설립일자
	String cntrDdcTy;//공제유형
	String ctbgrnpAppnNo; //기부금단체 지정번호
	String dmstcTelno;// 전화번호
	String fxnum;// 팩스번호
	String  adres;// 주소
	String  adres_detail; //상세주소 -우편번호 검색 후에 남은주소 입력
	String  zip;// 우편번호
	String hmpadres;// 홈페이지주소
	String bizrno; // 사업자 등록번호
	int type_id;// 모집분야 - table - types랑 연동해서 id만 받아서 사용
	String nickname;
	Date register_date;
	 
	
	
	
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOrganization_id() {
		return organization_id;
	}
	public void setOrganization_id(String organization_id) {
		this.organization_id = organization_id;
	}
	public String getNanmmByNm() {
		return nanmmByNm;
	}
	public void setNanmmByNm(String nanmmByNm) {
		this.nanmmByNm = nanmmByNm;
	}
	public String getRprsntvNm() {
		return rprsntvNm;
	}
	public void setRprsntvNm(String rprsntvNm) {
		this.rprsntvNm = rprsntvNm;
	}
	public String getFondDe() {
		return fondDe;
	}
	public void setFondDe(String fondDe) {
		this.fondDe = fondDe;
	}
	public String getCntrDdcTy() {
		return cntrDdcTy;
	}
	public void setCntrDdcTy(String cntrDdcTy) {
		this.cntrDdcTy = cntrDdcTy;
	}
	public String getCtbgrnpAppnNo() {
		return ctbgrnpAppnNo;
	}
	public void setCtbgrnpAppnNo(String ctbgrnpAppnNo) {
		this.ctbgrnpAppnNo = ctbgrnpAppnNo;
	}
	public String getDmstcTelno() {
		return dmstcTelno;
	}
	public void setDmstcTelno(String dmstcTelno) {
		this.dmstcTelno = dmstcTelno;
	}
	public String getFxnum() {
		return fxnum;
	}
	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getAdres_detail() {
		return adres_detail;
	}
	public void setAdres_detail(String adres_detail) {
		this.adres_detail = adres_detail;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getHmpadres() {
		return hmpadres;
	}
	public void setHmpadres(String hmpadres) {
		this.hmpadres = hmpadres;
	}
	public String getBizrno() {
		return bizrno;
	}
	public void setBizrno(String bizrno) {
		this.bizrno = bizrno;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	@Override
	public String toString() {
		return "GroupUserCommand [user_id=" + user_id + ", password=" + password + ", name=" + name
				+ ", organization_id=" + organization_id + ", nanmmByNm=" + nanmmByNm + ", rprsntvNm=" + rprsntvNm
				+ ", fondDe=" + fondDe + ", cntrDdcTy=" + cntrDdcTy + ", ctbgrnpAppnNo=" + ctbgrnpAppnNo
				+ ", dmstcTelno=" + dmstcTelno + ", fxnum=" + fxnum + ", adres=" + adres + ", adres_detail="
				+ adres_detail + ", zip=" + zip + ", hmpadres=" + hmpadres + ", bizrno=" + bizrno + ", type_id="
				+ type_id + ", nickname=" + nickname + ", register_date=" + register_date + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
