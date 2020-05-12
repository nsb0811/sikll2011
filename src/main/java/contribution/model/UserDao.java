package contribution.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class UserDao extends SqlSessionDaoSupport{

	public int memberInsert(UserCommand command) {
		return getSqlSession().insert("gibunigajoa.memberInsert", command);
	}
	
	public int signupIdCheck(String user_id) {
		int num = getSqlSession().selectOne("gibunigajoa.signupIdCheck", user_id);
		System.out.println("Snum: "+num);
		return num;
	}
	
	public UserCommand loginCheck(HashMap<String, String> m) {
		UserCommand command = getSqlSession().selectOne("gibunigajoa.loginCheck", m);
		return command;
	}
	
	public UserCommand kakaoNaverloginCheck(String user_id) {
		UserCommand command = getSqlSession().selectOne("gibunigajoa.kakaoNaverloginCheck", user_id);
		return command;
	}
	//카카오톡 네이버 회원정보 저장
	public int kakaoNaverInsert(UserCommand command) {
		return getSqlSession().insert("gibunigajoa.kakaoNaverInsert", command);
	}
	
	//기부내역 가입자 금액 sum 등급 
	public int contributionSum(int user_idx) {
		return getSqlSession().selectOne("gibunigajoa.contributionSum", user_idx);
	}
	
	//기부금액에 따른 등급 update
	public int updateGrade(HashMap<String, Object> m) {
		return getSqlSession().update("gibunigajoa.updateGrade", m);
	}
	
	//user 등급확인 
	public int gradeCheck(int user_idx) {
		return getSqlSession().selectOne("gibunigajoa.gradeCheck", user_idx);
	}
	
	//최근관심 게시물 리스트 
	public List<ProgramBannerDto> readCntList(Date date) {
		System.out.println("userDAO: "+date);
		return getSqlSession().selectList("gibunigajoa.readCntList", date);
	}
	
	//마감임박 게시물 리스트 
	public List<ProgramBannerDto> dateAscList(Date date){
		System.out.println("date: "+date);
		return getSqlSession().selectList("gibunigajoa.dateAscList", date);
	}
	
	//main 배너 최신 게시물 홍보 
	public List<ProgramBannerDto> newAscList(Date date){
		System.out.println("main 배너 최신 게시물 홍보");
		return getSqlSession().selectList("gibunigajoa.newAscList", date);
	}
	
}
