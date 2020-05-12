package contribution.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramBannerDao extends SqlSessionDaoSupport{

		//개인회원용 -전체분야의 모집프로그램리스트
		public List<ProgramBannerDto> getAllProgramList() {
			//System.out.println(getSqlSession().selectList("program.getAllProgramList"));
			return getSqlSession().selectList("program.getAllProgramList");
		}
	
		//개인회원용 -분야별 모집프로그램리스트
		public List<ProgramBannerDto> getTypeProgramList(int type_id) {
			return getSqlSession().selectList("program.getTypeProgramList", type_id);
		}
	
		//개인회원용 - 분야별프로그램 검색
		public List<ProgramBannerDto> searchProgramType(Map<String, Object> map){
			return getSqlSession().selectList("program.searchProgramType", map);
		}
		
		//개인회원용 - 프로그램검색 - 전체
		public List<ProgramBannerDto> searchProgram(String searchKeyword){
			return getSqlSession().selectList("program.searchProgram", searchKeyword);
		}
		
	
}
