package contribution.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class MypageDao extends SqlSessionDaoSupport{
	
	//기부내역 리스트
	public List<ContributionDto> ContributionList(int user_idx){
		return getSqlSession().selectList("project.ContributionList",user_idx);
	}
	
	//Q&A 리스트
	public List<QandADto> QandAList(int user_idx){
		return getSqlSession().selectList("project.QandAList",user_idx);
	}
	
	//단체 즐겨찾기 리스트
	public List<BookmarkDto> bookmarkList(int user_idx){
		return getSqlSession().selectList("project.bookmarkList",user_idx);
	}
	
	//기부내역 상세글 보기
	public ContributionDto ContributionContent(int contribution_history_idx){
		return getSqlSession().selectOne("project.ContributionContent",contribution_history_idx);
	}
	
	//Q&A 상세글 보기
	public QandADto QandAContent(int board_idx){
		return getSqlSession().selectOne("project.QandAContent",board_idx);
	}
	
	//기부내역 추가
	public int insertContribution(ContributionDto dto) {
		return getSqlSession().insert("project.insertContribution",dto);
	}
	
	//카카오&네이버 결제 기부내영 추가 
	public int payInsertContribution(ContributionDto command) {
		return getSqlSession().insert("project.payInsertContribution", command);
	}
	
	//기부내역 수정
	public int updateContribution(ContributionDto dto) {
		return getSqlSession().update("project.update",dto);
	}
	
	//기부내역 삭제
	public int deleteContribution(int contribution_history_idx) {
		return getSqlSession().delete("project.delete",contribution_history_idx);
	}

	//Q&A 추가
	public int insertQandA(QandADto dto) {
		return getSqlSession().insert("project.insertQandA",dto);
	}
	
	//회원정보 수정 폼 가기
	public UserCommand UserUpdateForm(int user_idx) {
		return getSqlSession().selectOne("project.updateform",user_idx);
	}
	
	//회원정보 업데이트
	public int updateUser(UserCommand dto) {
		return getSqlSession().update("project.updateUser",dto);
	}
	
	//회원 탈퇴 비밀번호 체크
	public UserCommand deleteUserCheck(HashMap<Object, Object> m) {
		return getSqlSession().selectOne("project.deleteUserCheck", m);
		
	}
	
	//회원 탈퇴
	public int deleteUser(int user_idx) {
		return getSqlSession().delete("project.deleteUser",user_idx);
	}
	
	//공지사항 리스트
	public List<NoticeDto> noticeList(){
		return getSqlSession().selectList("project.noticeList");
	}
	
	//공지사항상세글 보기
	public NoticeDto noticeContent(int notice_idx){
		return getSqlSession().selectOne("project.noticeContent",notice_idx);
	}
	
	//공지사항 조회수 올리기
	public int noticeReadcount(int notice_idx) {	
		System.out.println(notice_idx);
		return getSqlSession().update("project.noticeReadcount",notice_idx);      
	}
}
