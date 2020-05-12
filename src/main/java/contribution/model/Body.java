package contribution.model;

import java.util.ArrayList;

public class Body {

	int numOfRows;// 한 페이지 결과 수

	int pageNo; // 페이지번호
	int totalCount;// 전체 결과 수

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	Items items;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Body [numOfRows=" + numOfRows + ", pageNo=" + pageNo + ", totalCount=" + totalCount + ", items=" + items
				+ "]";
	}

}
