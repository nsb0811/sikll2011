package contribution.model;

 

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class DetailOrganizationDao extends SqlSessionDaoSupport {

	
	//등록번호로 단체회원가입이 되있는지 확인
	public int DetailCount(String organization_id) {
		return getSqlSession().selectOne("Kim.select-organizations_count",organization_id);
		
	}
	
	
	
	//400인 친구들 상세화면정보 뿌려주기 
   public GroupUserCommand Detail(String organization_id){
	   
	 
	 return getSqlSession().selectOne("Kim.select-organizationsAll",organization_id) ;
   }
	
   //상세화면에 모집프로그램 뿌려주기
   public List<Program> DetailProgram(String organization_id){
	   
	  return getSqlSession().selectList("Kim.select-programAll",organization_id);
	  	   
	   
   }
   //상세화면에 뿌려줄 모집프로그램 유무검사
   public int DetailPrgramCount(String organization_id) {
	   
	   return getSqlSession().selectOne("select-programCount",organization_id);
	   
   }
   
   
   
	
}
