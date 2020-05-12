package contribution.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class CommentDao extends SqlSessionDaoSupport{

	
	//block되지 않은 프로그램의 모든 댓글습득
	public List<CommentViewDto> getAllComment(Map<String, Object> map){
		return getSqlSession().selectList("comment.getAllComment", map);
	}
	
	//timestamp로 사용->사용안하는 메서드
	//댓글등록시 필요한 comment_id세팅
	public int getCommentId(Map<String, Object> map) {
		return getSqlSession().selectOne("comment.selectCommentId");
	}
	
	//댓글등록
	public int insertComment(Comment comment) {
		return getSqlSession().insert("comment.insertComment", comment);
	}
	
	//댓글신고 || alert후에 notify_flg변경시 
	public int updateAlertComment(Comment comment) {
		return getSqlSession().update("comment.alertComment", comment);
	}
	
	//신고 5회로 완전 block처리 & notify_flg = 1
	public int updateBlockComment(Comment comment) {
		return getSqlSession().update("comment.blockComment", comment);
	}
	
	//댓글신고 insert
	public int insertReportComment(ReportComment reportComment) {
		return getSqlSession().insert("comment.insertReportComment", reportComment);
	}
	
	//insert전에 커멘트의 신고횟수를 습득
	public int selectReportCommentCount(ReportComment reportComment) {
		return getSqlSession().selectOne("comment.selectReportCommentCount",reportComment); 
	}
	
	//이미 신고한 댓글인지 count로 습득
	public int checkReportedComment(ReportComment reportComment) {
		return getSqlSession().selectOne("comment.checkReportedComment", reportComment);
	}
	
	//로그인시 alert해줄 comment있는지 확인
	public int notifyCheck(int user_idx) {
		return getSqlSession().selectOne("comment.notifyCheck",user_idx);
	}
	
	//reportComment alert후에 flg = 0으로 수정
	public void updateNotifyFlg(int user_idx) {
		getSqlSession().update("comment.updateNotifyFlg", user_idx);
	}
	
}
