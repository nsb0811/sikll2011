package contribution.service;




import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.DetailOrganizationDao;
import contribution.model.GroupUserCommand;
import contribution.model.Program;

@Service
public class DetailOrganizationService {

	
	DetailOrganizationDao dao;

	@Autowired
	public void setDao(DetailOrganizationDao dao) {
		this.dao = dao;
	}  
	//해당등록번호가 우리쪽db에 저장되있는지 확인하고 있으면 검색결과 리턴하고 없으면 비어있는객체 리턴 
	public GroupUserCommand Detail(String organization_id){
		//해당등록번호로 검색해서 테이블에 카운트가 1이면 있는거니 해당테이블에있는 상세화면데이터 뿌려주고
		if(dao.DetailCount(organization_id)>=1) {
		return dao.Detail(organization_id);
		}else { //아닐경우는 비어있는 객체리턴함
			GroupUserCommand guc = new GroupUserCommand();
			return guc;
			
					}
	} 
	//해당 단체에 프로그램이있을경우 리턴해주고 없다면 빈 리스트 리턴
	public List<Program> DetailProgram(String organization_id){
		
		if(dao.DetailPrgramCount(organization_id)>=1) {
			return dao.DetailProgram(organization_id);
			
		}else {return Collections.EMPTY_LIST;}
		
		
	}
	
	
	
}
