package contribution.service;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.ContributionDto;
import contribution.model.MypageDao;
import contribution.model.ProgramBannerDto;
import contribution.model.UserCommand;
import contribution.model.UserDao;


@Service
public class GibunigajoaService{
	@Autowired
	UserDao userDao;
	@Autowired
	MypageDao mypageDao;
	

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public int memberInsert(UserCommand command) {
		return userDao.memberInsert(command);
	}
	
	public int signupIdCheck(String user_id) {
		return userDao.signupIdCheck(user_id);
	}
	
	public UserCommand loginCheck(HashMap<String, String> m) {
		return userDao.loginCheck(m);
	}
	
	public UserCommand kakaoNaverloginCheck(String user_id) {
		return userDao.kakaoNaverloginCheck(user_id);
	}
	
	//카카오톡 네이버 회원정보 저장 
	public int kakaoNaverInsert(UserCommand command) {
		return userDao.kakaoNaverInsert(command);
	}
	
	//카카오&네이버 결제 내역 저장 
	public int payInsertContribution(ContributionDto command) {
		return mypageDao.payInsertContribution(command);
	}
	
	//등급을 위한 사용가 총 기부내역 sum 
	public int contributionSum(int user_idx) {
		return userDao.contributionSum(user_idx);
	}
	
	//기부금액에 따른 등급 update
	public int updateGrade(HashMap<String, Object> m) {
		return userDao.updateGrade(m);
	}
	
	//user 등급확인
	public int gradeCheck(int user_idx) {
		return userDao.gradeCheck(user_idx);
	}
	
	//최근관심 게시물 리스트 
	public List<ProgramBannerDto> readCntList(Date date) {
		return userDao.readCntList(date);
	}
	
	//마감임박 게시물 리스트 
	public List<ProgramBannerDto> dateAscList(Date date){
		return userDao.dateAscList(date);
	}
	
	//main 배너 최신 게시물 홍보 
	public List<ProgramBannerDto> newAscList(Date date){
		return userDao.newAscList(date);
	}
}
