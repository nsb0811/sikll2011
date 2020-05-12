package contribution.model;

public class Response {

	Header header;
	Body body;

	public Header getHeader() {
		return header;
	}

	public void setHeader(Header header) {
		this.header = header;
	}

	public Body getBody() {
		return body;
	}

	public void setBody(Body body) {
		this.body = body;
	}

	@Override
	public String toString() {
		return "Response [header=" + header + ", body=" + body + "]";
	}
	

}
