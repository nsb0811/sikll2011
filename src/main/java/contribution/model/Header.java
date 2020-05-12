package contribution.model;

public class Header {

	
	String resultCode;//결과코드
	String resultMsg;//결과메세지
	
	
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	@Override
	public String toString() {
		return "Header [resultCode=" + resultCode + ", resultMsg=" + resultMsg + "]";
	}
	
	
	
	
}
