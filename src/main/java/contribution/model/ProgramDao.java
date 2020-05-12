package contribution.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramDao extends SqlSessionDaoSupport{

	public int insertProgram(Program program) {
		return getSqlSession().insert("program.insertProgram", program);
	}
	
	public int programCount(String organization_id) {
		return getSqlSession().selectOne("program.selectProgramCount", organization_id);
	}
	
	public List<Program> requestProgramList(String organization_id){
		return getSqlSession().selectList("organization.selectRequestProgramList", organization_id);
	}
	
	public Program requestProgramDetail(Map<String, Object> map) {
		return getSqlSession().selectOne("program.selectProgram", map);
	}
	
	
	//미승인프로그램 수정 - 배너, 이미지 접근불가
	public int updateProgram(Program program) {
		return getSqlSession().update("program.updateProgram", program);
	}
	
	//승인프로그램 수정 - 배너, 이미지 접근가능
	public int updateProgramApproval(Program program) {
		return getSqlSession().update("program.updateProgramApproval", program);
	}
	
	
	//배너이미지 insert
	public int insertProgramBanner(ProgramImage imageInfo) {
		return getSqlSession().insert("program.insertProgramImage", imageInfo);
	}
	
	public List<Program> selectAllProgramList() {
		return getSqlSession().selectList("program.selectAllRequestProgramList");
	}
	
	//프로그램 승인상태 변경
	public int updateApprovalFlg(String organization_id, int program_id, int approval_flg) {
		Map<String, Object> approvalInfo = new HashMap<String, Object>();
		approvalInfo.put("program_id", program_id);
		approvalInfo.put("organization_id", organization_id);
		approvalInfo.put("approval_flg", approval_flg);
		return getSqlSession().update("program.updateApprovalFlg", approvalInfo);
	}
	
	//프로그램의 총 모집금액 합계계산
	public int calcTargetAmount(Map<String, Object> programSearchKeyword) {
		int totalAmount = 0;
		if(getSqlSession().selectOne("program.calcTargetAmount", programSearchKeyword) != null) {
			totalAmount = getSqlSession().selectOne("program.calcTargetAmount", programSearchKeyword);
		}
		return totalAmount;
	}
	
	//프로그램 조회수 올리기
	public int updateReadcount(Map<String, Object> programSearchKeyword) {
		return getSqlSession().update("program.updateProgramReadcount", programSearchKeyword);
	}
	
	//프로그램 전체 이미지 습득
	public List<String> getAllImages(Map<String, Object> programSearchKeyword){
		return getSqlSession().selectList("program.selectProgramImages", programSearchKeyword);
	}
	
	//프로그램상세 - 기부단체이름습득
	public String getOrganizationName(String organization_id) {
		return getSqlSession().selectOne("program.getOrganizationName", organization_id);
	}
	
	//프로그램 등록된 배너 삭제->공백처리
	public int deleteBanner(Map<String, Object> programSearchKeyword) {
		return getSqlSession().update("program.deleteBanner", programSearchKeyword);
	}
	
	//프로그램의 이미지 삭제 -> 개별 delete
	public int deleteImage(Map<String, Object> imageSearchKeyword) {
		return getSqlSession().delete("program.deleteImages", imageSearchKeyword);
	}
	
}
