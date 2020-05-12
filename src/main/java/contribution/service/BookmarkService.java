package contribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.BookmarkDao;
import contribution.model.BookmarkDto;;

@Service 
public class BookmarkService {
  //즐겨찾기 dao
	BookmarkDao dao;
    
	@Autowired
	public void setDao(BookmarkDao dao) {
		this.dao = dao;
	}
	
	//해당단체를 클릭했을때  북마크DB 에 즐겨찾기 정보가있으면 삭제  없으면 인서트  
	public int insertOrDelete(int user_idx,String organization_id,String nanmmbyNm) {
		int i;
		if(dao.selectBookmark(user_idx, organization_id)==0) {
			dao.insertBookmark(user_idx, organization_id,nanmmbyNm);
			//인서트하면 1 리턴해주고 이미지파일 핑크색 별모양으로 바꿔주고 
			i =1; 
		     return i;
		}else {
			dao.deleteBookmark(user_idx, organization_id);
			//이미있는경우에 들어왔다면 삭제시키고 검은색 별모양으로 바꿔줌
			i=0;
			return i;
		}
		
	}
		
	public int selectBookmark(int user_idx,String organization_id) {
		
		
		return dao.selectBookmark(user_idx, organization_id);
	
		 
		
     //처음뿌려줄 즐겨찾기에 공공데이터 등록번호와 우리 db에 가지고있는 db를 비교하기위해 검색
	}public List<BookmarkDto> selectBookmarkDto(int user_idx){
		
		
		return dao.selectBookmarkDto(user_idx);
		
	}
	//상세화면에 처음뿌려줄 즐겨찾기유무
	public int DetailBookmarkChk(int user_idx,String organization_id) {
		int i;
		if(dao.selectBookmark(user_idx, organization_id)==0) {
			i=0;
			return i;
		}else {
			i=1;
			return i;
		}
		
	}
	
	
	
	
}
