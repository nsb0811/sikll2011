package contribution.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class BookmarkDao extends SqlSessionDaoSupport {

	
	//해당 유니크키들고가서 카운트해줌 0이면 없는경우 1이면 이미 즐겨찾기가있는경우
	public int selectBookmark(int user_idx,String organization_id) {
		 
	  Map<String,Object> map = new HashMap<String, Object>();
	  
	  map.put("user_idx",user_idx);
	  map.put("organization_id",organization_id);
		
	    
	  return 	getSqlSession().selectOne("Kim.select-bookmark",map);
		
		
	}//해당유저에 즐겨찾기 인서트
	public int insertBookmark(int user_idx,String organization_id,String nanmmbyNm) {
	
		Map<String,Object> map = new HashMap<String, Object>();
		 
		  map.put("user_idx",user_idx);
		  map.put("organization_id",organization_id);
		  map.put("nanmmbyNm",nanmmbyNm);
		
		
		return getSqlSession().insert("Kim.insert-bookmark",map);  
	}
	//해당유저에 즐겨찾기 딜리트
	public int deleteBookmark(int user_idx,String organization_id) {

		Map<String,Object> map = new HashMap<String, Object>();
		  
		  map.put("user_idx",user_idx);
		  map.put("organization_id",organization_id);
		
		return getSqlSession().delete("Kim.delete-bookmark",map);
		
	}
	//처음뿌려줄 즐겨찾기에 공공데이터 등록번호와 우리 db에 가지고있는 db를 비교하기위해 검색
	public List<BookmarkDto> selectBookmarkDto(int user_idx){
		
		return getSqlSession().selectList("Kim.select-organization_id",user_idx);
	}
	
	
	



	
	
	
	
	
	
	
}
