package contribution.lsb.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import contribution.model.BookmarkDto;
import contribution.model.ContributionDto;
import contribution.model.NoticeDto;
import contribution.model.QandADto;
import contribution.model.UserCommand;
import contribution.service.GroupUserService;
import contribution.service.MypageService;

@Controller
public class ProjectController {

	@Autowired
	MypageService service;

	// 단체 회원 탈퇴 dao
	GroupUserService gusdao;

	public void setService(MypageService service) {
		this.service = service;
	}

	@Autowired
	public void setGusdao(GroupUserService gusdao) {
		this.gusdao = gusdao;
	}

	// 기부내역 입력
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insertdonation(ContributionDto dto) {
		dto.setDate(addHour(dto.getDate())); //9시간 더하기
		service.insertContribution(dto);
		return "redirect:/mypage.do";
	}

	// Q&A 입력
	@RequestMapping(value = "/qANDaInsert.do", method = RequestMethod.POST)
	public String qAndAInsert(QandADto dto) {
		service.insertQandA(dto);
		return "redirect:/qANDa.do";
	}

	// 기부 내역 user_idx를 받아서 리스트 보기
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView ContributionList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int idx = (int) session.getAttribute("user_idx");
		List<ContributionDto> list = service.ContributionList(idx);
		mav.addObject("list", list);
		mav.setViewName("mypage");
		return mav;
	}

	// Q&A user_idx를 받아서 리스트 보기
	@RequestMapping(value = "/qANDa.do", method = RequestMethod.GET)
	public ModelAndView QandAList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int idx = (int) session.getAttribute("user_idx");
		List<QandADto> list = service.QandAList(idx);
		mav.addObject("list", list);
		mav.setViewName("qANDa");
		return mav;
	}

	// 기부 내역 상세 글 보기 (modal창으로 가야하므로 ajax로 보냄)
	@RequestMapping(value = "/ContributionContent.do", method = RequestMethod.POST)
	public void ContributionContent(HttpServletResponse resp, int num) throws Exception {
		ContributionDto list = service.ContributionContent(num);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	// 기부 내역 수정폼 가기 (modal창으로 가야하므로 ajax로 보냄)
	@RequestMapping(value = "/ContributionUpdate.do", method = RequestMethod.POST)
	public void ContributionUpdate(HttpServletResponse resp, int num2) throws Exception {
		ContributionDto list = service.ContributionContent(num2);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	// 기부내역 수정하기
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updatedonation(ContributionDto dto) {
		dto.setDate(addHour(dto.getDate())); //9시간 더함
		service.updateContribution(dto);
		return "redirect:/mypage.do";
	}

	// Q&A 상세 글 보기
	@RequestMapping(value = "/QandAContent.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public ModelAndView QandAContent(int board_idx) throws Exception {
		ModelAndView mav = new ModelAndView();
		QandADto list = service.QandAContent(board_idx);
		mav.addObject("list", list);
		mav.setViewName("qAndaContent");
		return mav;

	}

	// 기부내역 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deletedonation(int contribution_history_idx) {
		service.deleteContribution(contribution_history_idx);
		return "redirect:/mypage.do";
	}

	// 회원정보 수정 폼 가기
	@RequestMapping(value = "/updateUserForm.do", method = RequestMethod.GET)
	public ModelAndView updateUserForm(HttpSession session, UserCommand dto) {
		ModelAndView mav = new ModelAndView();
		int idx = (int) session.getAttribute("user_idx");
		UserCommand list = service.UpdateUserForm(idx);
		mav.addObject("list", list);
		mav.setViewName("updateUser");
		return mav;
	}

	// 회원정보 수정하기
	@RequestMapping(value = "/userUpdate.do", method = RequestMethod.POST)
	public String updateUser(UserCommand dto) {
		service.updateUser(dto);
		return "redirect:/mypage.do";
	}

	// 회원탈퇴 비밀번호 체크
	@RequestMapping(value = "/deleteUserCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteUserCheck(String password, HttpSession session) {
		Gson gson = new Gson();
		JsonObject json = new JsonObject();
		int idx = (int) session.getAttribute("user_idx");
		int num = 0;
		HashMap<Object, Object> m = new HashMap<Object, Object>();
		m.put("user_idx", idx);
		m.put("password", password);
		UserCommand user = service.deleteUserCheck(m);
		
		if (user == null) {
			num = 0;
		} else {
			num = 1;
		}
		json.addProperty("num", num);
		return gson.toJson(json);
	}

	// 회원탈퇴(개인,단체)
	@RequestMapping(value = "/deleteUser.do")
	public String deletedonation(HttpSession session) {

		int idx = (int) session.getAttribute("user_idx");
		String organization_id = (String) session.getAttribute("organization_id");
		int type_id = (int) session.getAttribute("user_type_id");

		if (type_id == 2) {
			service.deleteUser(idx);
			gusdao.deleteLogo(organization_id);
			gusdao.deleteOrganization(organization_id);
			session.invalidate();
			return "redirect:/main.do";

		} else {
			service.deleteUser(idx);
			session.invalidate();
			return "redirect:/main.do";
		}
	}

	// 공지사항 리스트
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public ModelAndView NoticeList() {
		ModelAndView mav = new ModelAndView();
		List<NoticeDto> list = service.noticeList();
		mav.addObject("list", list);
		mav.setViewName("notice");
		return mav;
	}

	// 공지사항 상세글
	@RequestMapping(value = "/noticeContent.do", method = RequestMethod.GET)
	public ModelAndView NoticeContent(int notice_idx) {
		ModelAndView mav = new ModelAndView();
		NoticeDto list = service.noticeContent(notice_idx);
		service.noticeReadCount(notice_idx);
		mav.addObject("list", list);
		mav.setViewName("noticeContent");
		return mav;
	}

	/* 즐겨찾기 리스트 */
	@RequestMapping(value = "/bookmark.do", method = RequestMethod.GET)
	public ModelAndView bookmarkList(HttpSession session) {
		int idx = (int) session.getAttribute("user_idx");
		ModelAndView mav = new ModelAndView();
		List<BookmarkDto> list = service.bookmarkList(idx);
		mav.addObject("list", list);
		mav.setViewName("bookmark");
		return mav;

	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setTimeZone(tz);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	// 날짜9시간 추가
	public Date addHour(Date oldDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(oldDate);
		cal.add(Calendar.HOUR, 9);
		return new Date(cal.getTimeInMillis());
	}
	
	@ExceptionHandler(Exception.class)
	 public ModelAndView handleException(HttpServletRequest request, Exception ex) {
		System.out.println("들어오니?");
	    ModelAndView mv =new ModelAndView("error/exception");
	    System.out.println("Message: "+ex.getMessage());
	    mv.addObject("message", ex.getMessage());
	    return mv;
	 }
}
