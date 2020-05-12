package contribution.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import contribution.model.BookmarkDto;
import contribution.model.ContributionDto;
import contribution.model.MypageDao;
import contribution.model.NoticeDto;
import contribution.model.QandADto;
import contribution.model.UserCommand;

@Service
public class MypageService {

	@Autowired
	MypageDao dao;

	public void setDao(MypageDao dao) {
		this.dao = dao;
	}

	// 기부내역 리스트 보기
	public List<ContributionDto> ContributionList(int user_idx) {
		return dao.ContributionList(user_idx);
	}

	// Q&A 리스트 보기
	public List<QandADto> QandAList(int user_idx) {
		return dao.QandAList(user_idx);
	}
	
	// Q&A 리스트 보기
	public List<BookmarkDto> bookmarkList(int user_idx) {
		return dao.bookmarkList(user_idx);
	}

	// 기부내역 상세글 보기
	public ContributionDto ContributionContent(int contribution_history_idx) {
		return dao.ContributionContent(contribution_history_idx);
	}

	// Q&A 상세글 보기
	public QandADto QandAContent(int board_idx) {
		return dao.QandAContent(board_idx);
	}

	// 기부내역 추가
	public int insertContribution(ContributionDto dto) {
		return dao.insertContribution(dto);
	}

	// 기부내역 수정
	public int updateContribution(ContributionDto dto) {
		return dao.updateContribution(dto);
	}

	// 기부내역 삭제
	public int deleteContribution(int contribution_history_idx) {
		return dao.deleteContribution(contribution_history_idx);
	}

	// Q&A 추가
	public int insertQandA(QandADto dto) {
		return dao.insertQandA(dto);
	}

	// 회원정보 수정 폼 가기
	public UserCommand UpdateUserForm(int user_idx) {
		return dao.UserUpdateForm(user_idx);
	}

	// 기부내역 수정
	public int updateUser(UserCommand dto) {
		return dao.updateUser(dto);
	}

	// 회원 탈퇴 비밀번호 체크
	public UserCommand deleteUserCheck(HashMap<Object, Object> m) {
		return dao.deleteUserCheck(m);
	}

	// 회원 탈퇴
	public int deleteUser(int user_idx) {
		return dao.deleteUser(user_idx);
	}

	// 공지사항 리스트
	public List<NoticeDto> noticeList() {
		return dao.noticeList();
	}

	// 공지사항 상세글 보기
	public NoticeDto noticeContent(int notice_idx) {
		return dao.noticeContent(notice_idx);
	}

	// 공지사항 조회수 올리기
	public int noticeReadCount(int notice_idx) {
		return dao.noticeReadcount(notice_idx);
	}
}
