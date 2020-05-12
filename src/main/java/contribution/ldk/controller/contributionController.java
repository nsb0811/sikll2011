package contribution.ldk.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import contribution.kms.controller.ResponseController;
import contribution.model.Comment;
import contribution.model.FileUtils;
import contribution.model.GroupUserCommand;
import contribution.model.Program;
import contribution.model.ProgramBannerDto;
import contribution.model.ProgramImage;
import contribution.model.ReportComment;
import contribution.model.Type;
import contribution.modelone.ResponseOne;
import contribution.service.DetailOrganizationService;
import contribution.service.programService;

@Controller
public class contributionController {

	@Autowired
	ResponseController responseCon;

	@Autowired
	public void setResponseCon(ResponseController responseCon) {
		this.responseCon = responseCon;
	}
	
	@Autowired
	DetailOrganizationService organizationService;
	
	
	
	public void setOrganizationService(DetailOrganizationService organizationService) {
		this.organizationService = organizationService;
	}

	@Autowired
	private programService service;

	public void setService(programService service) {
		this.service = service;
	}
	
	

	// 클래스에 들어올때마다 호출 ->언제나 필요한 경우 아니면 붙이지말자.
	// @ModelAttribute
	/*
	 * public void getTypes(Model model) {
	 * System.out.println("@ModdelAttribute /getTypes");
	 * model.addAttribute("typeList", service.selectTypes()); }
	 */

	@RequestMapping(value = "/registerForm.do", method = RequestMethod.GET)
	public ModelAndView registerForm(HttpSession session) {
		// session.setAttribute("organization_id", "00000015");
		ModelAndView mav = new ModelAndView("registerForm");
		mav.addObject("program", new Program());
		List<Type> typeList = service.selectTypes();
		mav.addObject("typeList", typeList);
		// System.out.println("서버경로 : " + session.getServletContext().getRealPath("/"));
		// registerForm페이지에서 commandName과 모델명을 일치 -> 빈 객체를 만들고 안에다 채워넣는다의 느낌.
		return mav;
	}

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setTimeZone(tz);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	// 프로그램신청 등록
	@RequestMapping(value = "/registerProgram.do", method = RequestMethod.POST)
	// 요청마다 session이 존재하는 범위이기 때문에, session이 필요한 메서드에서는 요청별 파라미터로 받아서 넘겨준다.
	public ModelAndView registerProgram(@ModelAttribute("program") Program pro, HttpSession session) {
		// pro.setOrganization_id("000000015");
		
		System.out.println("program : " + pro);
		pro.setStart_date(addHour(pro.getStart_date()));
		pro.setEnd_date(addHour(pro.getEnd_date()));
		int rowNum = service.insertProgram(pro);
		if (rowNum > 0) {
			return requestList(session);
		} else {
			return new ModelAndView("errors/error");
		}
	}

	// 각 기부단체 별 신청한 프로그램 리스트
	@RequestMapping(value = "/requestList.do", method = RequestMethod.GET)
	public ModelAndView requestList(HttpSession session) {
		// session의 organization_id으로 받아옴.
		String organization_id = (String) session.getAttribute("organization_id");
		ModelAndView mav = new ModelAndView("requestProgramList");
		mav.addObject("programLists", service.requestProgramList(organization_id));
		return mav;
	}

	
	
	// 프로그램상세
	@RequestMapping(value = "/showProgram.do", method = RequestMethod.GET)
	public ModelAndView showProgramContent(int program_id, String organization_id) throws ParseException {
		int updateReadCount = updateReadcount(program_id, organization_id);
		ModelAndView mav = new ModelAndView("requestProgramDetail");
		Program pro = service.getProgramInfo(program_id, organization_id);
		mav.addObject("requestProgram", pro);
		mav.addObject("typeValue", service.selectTypeValue(pro.getType_id()));
		List<String> images = service.getAllImages(program_id, organization_id);
		mav.addObject("images", images);
		mav.addObject("totalAmount", calcTargetAmount(program_id, organization_id));
		mav.addObject("organization_name", service.getOrganizationName(organization_id));
		mav.addObject("comments", service.getAllComment(program_id, organization_id));
		//System.out.println(service.getAllComment(program_id, organization_id));
		//공공데이터에서 습득할 수 있는지에 대한 count -> 1이면 공공데이터에서 습득, 0이면 공공데이터사용x->DB까지 확인할 것.
		int cnt = responseCon.getOrganizationCntInfo(organization_id);
		
		if(cnt > 0) {
			//공공데이터에서 습득했는지, DB에서 습득했는지 구분용
			//공공데이터에서 습득 = 1
			mav.addObject("dataFlg", 1);
			ResponseOne organizationInfo = responseCon.getOrganizationInfo(organization_id);
			/*
			 * String foundationDate =
			 * organizationInfo.getResponse().getBody().getItems().getItem().getFondDe().
			 * trim(); //공공데이터받아온 String타입의 설립일을 중간중간에 년월일 추가시키기 if(foundationDate != null)
			 * { StringBuffer sb=new StringBuffer(str); sb.insert(4, "년 "); sb.insert(8,
			 * "월 "); sb.insert(12,"일"); model.addAttribute("date",sb);
			 * 
			 * } mav.addObject("foundationDate", foundDate);
			 */
			mav.addObject("organizationCnt", cnt);
			mav.addObject("organizationInfo", organizationInfo);
		}else {
			//DB에 존재하나 확인 -> organization객체 리턴.
			GroupUserCommand organization = organizationService.Detail(organization_id);
			if(organization.getOrganization_id().equals("")) {//빈 객체 -> DB에서도 습득불가
				mav.addObject("organizationCnt", 0);
			}else {//DB에서라도 정보습득
				//공공데이터에서 습득했는지, DB에서 습득했는지 구분용
				//공공데이터에서 습득 = 2
				mav.addObject("dataFlg", 2);
				mav.addObject("organizationCnt", 1);
				mav.addObject("organizationInfo", organization);
				System.out.println(organization);
			}
			
		}
		
		/* System.out.println(responseCon.getOrganizationCntInfo(organization_id)); */
		return mav;
	}

	public int updateReadcount(int program_id, String organization_id) {
		return service.updateReadcount(service.makeMap(program_id, organization_id));
	}

	// 기부이력으로 프로그램 기부내역 합계 계산
	public int calcTargetAmount(int program_id, String organization_id) {
		return service.calcTargetAmount(service.makeMap(program_id, organization_id));
	}

	// service로 이동
	/*
	 * public Program getProgramInfo(int program_id, String organization_id) {
	 * Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
	 * programSearchKeyword.put("organization_id", organization_id);
	 * programSearchKeyword.put("program_id", program_id); Program pro =
	 * service.requestProgramDetail(programSearchKeyword); return pro; }
	 */

	// service로 이동
	/*
	 * public List<ProgramImage> getProgramBanner(int program_id, String
	 * organization_id) { Map<String, Object> programSearchKeyword = new
	 * HashMap<String, Object>(); programSearchKeyword.put("organization_id",
	 * organization_id); programSearchKeyword.put("program_id", program_id); return
	 * service.getProgramBanner(programSearchKeyword); }
	 */

	/*
	 * @RequestMapping(value = "/updateForm.do", method = RequestMethod.POST) public
	 * ModelAndView updateForm(@ModelAttribute Program updateProgram,HttpSession
	 * session) { ModelAndView mav = new ModelAndView("updateForm"); Program pro =
	 * service.getProgramInfo(updateProgram.getProgram_id(),
	 * updateProgram.getOrganization_id()); mav.addObject("updateProgram", pro);
	 * List<Type> typeList = service.selectTypes(); mav.addObject("typeList",
	 * typeList); // registerForm페이지에서 commandName과 모델명을 일치 -> 빈 객체를 만들고 안에다 채워넣는다의
	 * 느낌. return mav; }
	 */

	// 미승인 프로그램의 updateForm -배너, 이미지에 접근 불가!
	@RequestMapping(value = "/updateForm.do", method = RequestMethod.GET)
	public ModelAndView updateForm(String organization_id, int program_id, HttpSession session) {
		ModelAndView mav = new ModelAndView("updateForm");
		Program pro = service.getProgramInfo(program_id, organization_id);
		mav.addObject("updateProgram", pro);
		List<Type> typeList = service.selectTypes();
		mav.addObject("typeList", typeList);
		// registerForm페이지에서 commandName과 모델명을 일치 -> 빈 객체를 만들고 안에다 채워넣는다의 느낌.
		return mav;
	}

	// 승인 프로그램의 updateForm -배너, 이미지에 접근 가능!
	@RequestMapping(value = "/updateFormApproval.do", method = RequestMethod.GET)
	public ModelAndView updateFormApproval(String organization_id, int program_id, HttpSession session) {
		ModelAndView mav = new ModelAndView("updateFormApproval");
		Program pro = service.getProgramInfo(program_id, organization_id);
		mav.addObject("updateProgram", pro);
		List<Type> typeList = service.selectTypes();
		mav.addObject("typeList", typeList);
		// List<Map<String, Object>> programImageList = getImagesFileName(program_id,
		// organization_id);
		List<ProgramImage> programImageList = getImagesFileName(program_id, organization_id);
		mav.addObject("programImageList", programImageList);
		// registerForm페이지에서 commandName과 모델명을 일치 -> 빈 객체를 만들고 안에다 채워넣는다의 느낌.
		return mav;
	}

	// 프로그램의 원본파일, 저장된 파일명습득
	public List<ProgramImage> getImagesFileName(int program_id, String organization_id) {
		return service.getProgramFileName(program_id, organization_id);
	}

	/*
	 * // 승인된 프로그램의 수정
	 * 
	 * @RequestMapping(value = "/updateProgramApproval.do", method =
	 * RequestMethod.POST) // 요청마다 session이 존재하는 범위이기 때문에, session이 필요한 메서드에서는 요청별
	 * 파라미터로 받아서 넘겨준다. public ModelAndView
	 * updateProgramApproval(@ModelAttribute("requestProgram") Program
	 * requestProgram,
	 * 
	 * @RequestParam("banner") MultipartFile banner, @RequestParam("images")
	 * List<MultipartFile> programImages, HttpSession session, HttpServletRequest
	 * request) { System.out.println("승인update");
	 * System.out.println(requestProgram); String organization_id = (String)
	 * session.getAttribute("organization_id"); int program_id =
	 * requestProgram.getProgram_id(); String root =
	 * request.getServletContext().getRealPath("resources/images/"); String
	 * banner_file_name = ""; String original_file_name = ""; if (!banner.isEmpty())
	 * { Map<String, String> fileInfo = insertBanner(organization_id, program_id,
	 * root, banner); banner_file_name = fileInfo.get("stored_file_name");
	 * original_file_name = fileInfo.get("original_name"); }
	 * requestProgram.setOriginal_file_name(original_file_name);
	 * requestProgram.setBanner_file_name(banner_file_name);
	 * System.out.println("승인update"); System.out.println(requestProgram); int
	 * rowNum = service.updateProgramApproval(requestProgram); // String root =
	 * request.getServletContext().getRealPath("/");//프로젝트 외부에 올린 // resource파일에
	 * 허용접근불가-보안문제
	 * 
	 * if (rowNum > 0) { System.out.println(programImages); for (int i = 0; i <=
	 * programImages.size() - 1; i++) { if (!programImages.get(i).isEmpty()) {
	 * System.out.println(programImages.get(i)); ProgramImage imageInfo =
	 * insertImages(organization_id, program_id, root, programImages.get(i));
	 * service.insertProgramImage(imageInfo); } } return requestList(session);
	 * 
	 * } else { return new ModelAndView("errors/error"); } }
	 */

	// 승인된 프로그램의 수정
	// banner, programImages가 null인 경우, 현상태에서 수정하지 않는다.
	@RequestMapping(value = "/updateProgramApproval.do", method = RequestMethod.POST)
	// 요청마다 session이 존재하는 범위이기 때문에, session이 필요한 메서드에서는 요청별 파라미터로 받아서 넘겨준다.
	public ModelAndView updateProgramApproval(@ModelAttribute("requestProgram") Program requestProgram,
			@RequestParam("banner") MultipartFile banner, @RequestParam("images") List<MultipartFile> programImages,
			HttpSession session, HttpServletRequest request) {
		//System.out.println("승인update");
		System.out.println(requestProgram);
		requestProgram.setStart_date(addHour(requestProgram.getStart_date()));
		requestProgram.setEnd_date(addHour(requestProgram.getEnd_date()));
		String organization_id = (String) session.getAttribute("organization_id");
		int program_id = requestProgram.getProgram_id();
		String root = request.getServletContext().getRealPath("resources/images/");
		String banner_file_name = "";
		String original_file_name = "";
		if (!banner.isEmpty()) {
			Map<String, String> fileInfo = insertBanner(organization_id, program_id, root, banner);
			banner_file_name = fileInfo.get("stored_file_name");
			original_file_name = fileInfo.get("original_name");
		} else {
			banner_file_name = requestProgram.getBanner_file_name();
			original_file_name = requestProgram.getOriginal_file_name();
		}
		requestProgram.setOriginal_file_name(original_file_name);
		requestProgram.setBanner_file_name(banner_file_name);
		//System.out.println("승인update");
		System.out.println(requestProgram);
		int rowNum = service.updateProgramApproval(requestProgram);
		// String root = request.getServletContext().getRealPath("/");//프로젝트 외부에 올린
		// resource파일에 허용접근불가-보안문제

		if (rowNum > 0) {
			System.out.println(programImages);
			for (int i = 0; i <= programImages.size() - 1; i++) {
				if (!programImages.get(i).isEmpty()) {
					System.out.println(programImages.get(i));
					ProgramImage imageInfo = insertImages(organization_id, program_id, root, programImages.get(i));
					service.insertProgramImage(imageInfo);
				}
			}
			return requestList(session);

		} else {
			return new ModelAndView("errors/error");
		}
	}

	// 미승인 프로그램의 수정
	@RequestMapping(value = "/updateProgram.do", method = RequestMethod.POST)
	// 요청마다 session이 존재하는 범위이기 때문에, session이 필요한 메서드에서는 요청별 파라미터로 받아서 넘겨준다.
	public ModelAndView updateProgram(@ModelAttribute("requestProgram") Program requestProgram, HttpSession session) {
		String organization_id = (String) session.getAttribute("organization_id");
		int program_id = requestProgram.getProgram_id();
		requestProgram.setStart_date(addHour(requestProgram.getStart_date()));
		requestProgram.setEnd_date(addHour(requestProgram.getEnd_date()));
		//System.out.println("미승인update");
		System.out.println(requestProgram);
		int rowNum = service.updateProgramApproval(requestProgram);
		// String root = request.getServletContext().getRealPath("/");//프로젝트 외부에 올린
		// resource파일에 허용접근불가-보안문제

		return requestList(session);
	}

	// 프로그램배너 파일로 출력
	public Map<String, String> insertBanner(String organization_id, int program_id, String root, MultipartFile image) {
		FileUtils fileUtils = new FileUtils();
		return fileUtils.bannerImageUpload(image, organization_id, program_id, root);

	}

	// 프로그램이미지 업로드 후, programImage 객체를 리턴.
	public ProgramImage insertImages(String organization_id, int program_id, String root, MultipartFile image) {
		FileUtils fileUtils = new FileUtils();
		ProgramImage imageInfo = fileUtils.imageUpload(image, organization_id, program_id, root);
		imageInfo.setOrganization_id(organization_id);
		imageInfo.setProgram_id(program_id);
		imageInfo.setImage_url(root);
		return imageInfo;

	}

	// 기부단체, admin도 사용하던 리스트
	/*
	 * @RequestMapping(value = "/programList.do", method = RequestMethod.GET) public
	 * ModelAndView selectProgramList() { ModelAndView mav = new
	 * ModelAndView("programList"); mav.addObject("programList",
	 * service.selectAllProgramList()); return mav; }
	 */

	@RequestMapping(value = "/programList.do", method = RequestMethod.GET)
	public ModelAndView selectProgramList(int type) {
		ModelAndView mav = new ModelAndView("programList");
		if (type == 0) {
			mav.addObject("programList", service.getAllProgramList());
		} else {
			mav.addObject("programList", service.getTypeProgramList(type));
		}
		return mav;
	}

	@RequestMapping(value = "/deleteBanner.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteBanner(String organization_id, int program_id) {
		int rowNum = service.deleteBanner(program_id, organization_id);
		if (rowNum > 0) {
			System.out.println("공백수정");
		} else {
			System.out.println("banner delete error");
		}
	}

	@RequestMapping(value = "/deleteImage.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteImage(String organization_id, int program_id, String stored_file_name) {
		int rowNum = service.deleteImage(program_id, organization_id, stored_file_name);
		List<ProgramImage> fileNameList;
		Gson json = new Gson();
		if (rowNum > 0) {
			System.out.println("delete image");
		} else {
			System.out.println("image delete error");
		}
		fileNameList = service.getProgramFileName(program_id, organization_id);
		return json.toJson(fileNameList);
	}

	// 댓글등록폼
	@RequestMapping(value = "/registerComment.do")
	public ModelAndView registerCommentForm(String organization_id, int program_id, HttpSession session) {
		ModelAndView mav = new ModelAndView("contributionProgram/registerComment");
		Comment comment = new Comment();
		comment.setOrganization_id(organization_id);
		comment.setProgram_id(program_id);
		/*
		 * String idx = String.valueOf(session.getAttribute("user_idx"));
		 * comment.setUser_idx((Integer.parseInt(idx)));
		 */
		mav.addObject("comment", comment);
		return mav;
	}

	@RequestMapping(value = "/insertComment.do", method = RequestMethod.POST)
	@ResponseBody
	public void registerCommentProc(String organization_id, int program_id, String content, HttpSession session) {
		Comment comment = new Comment();
		comment.setOrganization_id(organization_id);
		comment.setProgram_id(program_id);
		comment.setContent(content);
		String idx = String.valueOf(session.getAttribute("user_idx"));
		comment.setRegister_date(new Date());
		comment.setUser_idx((Integer.parseInt(idx)));
		// System.out.println("comment정보 : "+comment);
		service.insertComment(comment);
	}

	// 이미 유저가 신고한 댓글인지 count확인
	@RequestMapping(value = "/checkComment.do", method = RequestMethod.POST)
	@ResponseBody
	public int checkReportedCount(String organization_id, int program_id, int user_idx, Timestamp comment_id,
			HttpSession session) {
		ReportComment comment = new ReportComment();
		comment.setOrganization_id(organization_id);
		comment.setProgram_id(program_id);
		comment.setUser_idx(user_idx);
		String idx = String.valueOf(session.getAttribute("user_idx"));
		if(idx == null || idx.equals("") || idx.equals("null")) {
			return -1;
		}else {
			comment.setReporter_idx(Integer.parseInt(idx));
			comment.setComment_id(comment_id);
			int count = service.checkReportedComment(comment);
			System.out.println("신고된 수 : " + count);
			return count;
		}
		
	}

	// 아직 신고되지 않은 댓글 -> insert후 notify_flg = 1
	// 이미 신고된 기록이 있는 댓글 -> 1~3사이의 count ->insert만
	// -> 이미 등록되어 있는 신고수의 count->4면, insert후에 notify_flg =1 AND block=1
	@RequestMapping(value = "/insertReportComment.do", method = RequestMethod.POST)
	@ResponseBody
	public void registerReportCommentProc(String organization_id, int program_id, int user_idx, Timestamp comment_id,
			HttpSession session) {
		ReportComment comment = new ReportComment();
		comment.setOrganization_id(organization_id);
		comment.setProgram_id(program_id);
		comment.setUser_idx(user_idx);
		String idx = String.valueOf(session.getAttribute("user_idx"));
		comment.setReporter_idx(Integer.parseInt(idx));
		comment.setComment_id(comment_id);
		System.out.println("reportComment정보 : " + comment);
		int reportCount = selectReportCommentCount(comment);
		if (reportCount == 0 || reportCount == 4) {
			// insert후에 notify_flg를 바꿔줘야하는 조건 ->tempComment로 파라미터만들어줌.
			service.insertReportComment(comment);
			Comment tempComment = new Comment();
			tempComment.setOrganization_id(organization_id);
			tempComment.setProgram_id(program_id);
			tempComment.setUser_idx(user_idx);
			tempComment.setComment_id(comment_id);
			tempComment.setReport_notify_flg(1);
			if (reportCount == 0) {
				// 첫신고 -> notify_flg = 1
				updateAlertComment(tempComment);
			} else {
				// 신고수=5 ->notify_flg = 1 && block_flg = 1;
				service.updateBlockComment(tempComment);
			}
		} else if (reportCount >= 1 && reportCount <= 3) {
			// 신고만
			service.insertReportComment(comment);
		}

	}

	// 댓글신고에 따른 notify_flg변경
	public int updateAlertComment(Comment comment) {
		return service.updateAlertComment(comment);
	}

	// 댓글신고전의 댓글의 신고횟수 습득
	public int selectReportCommentCount(ReportComment reportComment) {
		return service.selectReportCommentCount(reportComment);
	}

	/*
	 * @RequestMapping(value = "/deleteImage.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public void deleteImage(String organization_id, int program_id,
	 * String stored_file_name) { int rowNum = service.deleteImage(program_id,
	 * organization_id, stored_file_name); if(rowNum > 0) {
	 * System.out.println("delete image"); }else {
	 * System.out.println("image delete error"); } }
	 */

	@RequestMapping(value = "/notifyCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int notifyCheck(HttpSession session) {
		int cnt = 0;
		if (session.getAttribute("user_idx") != null) {
			String idx = String.valueOf(session.getAttribute("user_idx"));
			int user_idx = Integer.parseInt(idx);
			cnt = service.notifyCheck(user_idx);
			if (cnt > 0) {
				service.updateNotifyFlg(user_idx);
			}
		}
		return cnt;

	}

	//날짜9시간 추가
	public Date addHour(Date oldDate) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(oldDate);
		cal.add(Calendar.HOUR, 9);
		return new Date(cal.getTimeInMillis());
	}
	
	
	@RequestMapping(value = "/searchProgramType.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchProgramType(int type_id, String searchKeyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type_id", type_id);
		map.put("searchKeyword", searchKeyword);
		Gson json = new Gson();
		List<ProgramBannerDto> programItems;
		programItems = service.searchProgramType(map);
		
		return json.toJson(programItems);
	}
	
	
	@RequestMapping(value = "/searchProgram.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchProgram(String searchKeyword) {
		Gson json = new Gson();
		List<ProgramBannerDto> programItems;
		programItems = service.searchProgram(searchKeyword);
		return json.toJson(programItems);
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
