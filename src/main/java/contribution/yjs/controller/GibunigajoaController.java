package contribution.yjs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import contribution.ldk.controller.contributionController;
import contribution.model.ContributionDto;
import contribution.model.ProgramBannerDto;
import contribution.model.UserCommand;
import contribution.service.GibunigajoaService;


@Controller
public class GibunigajoaController {
	
	@Autowired
	GibunigajoaService gibunigajoaService;
	
	@Autowired
	contributionController contributionCtr;
	

	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
	@RequestMapping("/main.do")
	public ModelAndView mainForm() {
		System.out.println("main");
		ModelAndView m = new ModelAndView("main");
		
		List<ProgramBannerDto> p1 = gibunigajoaService.readCntList(new Date(System.currentTimeMillis()));
		List<ProgramBannerDto> p2 = gibunigajoaService.dateAscList(new Date(System.currentTimeMillis()));
		List<ProgramBannerDto> p3 = gibunigajoaService.newAscList(new Date(System.currentTimeMillis()));
		m.addObject("readCntList", p1);
		m.addObject("dateAscList", p2);
		m.addObject("newAscList", p3);
		System.out.println(p1.toString());
		System.out.println(p2.toString());
		System.out.println(p3.toString());
		
		return m;
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        System.out.println("naverAuthUrl"+naverAuthUrl);
        
        //네이버 로그인 URL 연결 
        model.addAttribute("url", naverAuthUrl);
		return "loginForm";
	}
	
	//naver 로그인 유전정보 존재시 로그인, 비존재시 회원정보 INSERT
	 @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
	            throws IOException, ParseException {
	        System.out.println("여기는 callback");
	       
	        OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //1. 로그인 사용자 정보를 읽어온다.
	        apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	        /** apiResult json 구조
	        {"resultcode":"00",
	        "message":"success",
	        "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	        **/
	        //2. String형식인 apiResult를 json형태로 바꿈
	        JSONParser parser = new JSONParser();
	        Object obj = parser.parse(apiResult);
	        JSONObject jsonObj = (JSONObject) obj;
	        
	        //3. 데이터 파싱
	        //Top레벨 단계 _response 파싱
	        JSONObject response_obj = (JSONObject)jsonObj.get("response");
	        //response의 nickname값 파싱
	        String user_id = (String)response_obj.get("id");
	        String email = (String)response_obj.get("email");//naver email을 기부니가조아 페이지에선 ID로 사용
	        String name = (String)response_obj.get("name");
	        String nickname = (String)response_obj.get("nickname");
	        String birthday = (String)response_obj.get("birthday");
	        System.out.println("id: "+user_id+" email:"+email+" name: "+name+" nickname: "+nickname+ "birthday: "+birthday);
	        
	        //존재하는 유저인지 확인 
	        int num = gibunigajoaService.signupIdCheck(email);
	        System.out.println("email: "+num);
	        if(num == 0) { //존재하지 않을 경우 값을 저장
	        	UserCommand command = new UserCommand();
	        	
	        	command.setUser_id(email);
	        	command.setName(name);
	        	command.setNickname(nickname);
	        	command.setUser_type_id(3);
	        	command.setGrade(0);
	    		command.setRegister_date(new Date(System.currentTimeMillis()));
	    		command.setOrganization_id("");
	    			    		
	    		int	result= gibunigajoaService.kakaoNaverInsert(command);
	        }
	        
	        	UserCommand command2 = gibunigajoaService.kakaoNaverloginCheck(email);
	        	System.out.println("command2: "+command2);
	        	session.setAttribute("user_idx", command2.getUser_idx());	
	        	session.setAttribute("user_id", command2.getUser_id());	
	        	session.setAttribute("nickname", command2.getNickname());	
	        	session.setAttribute("grade", command2.getGrade());	
	        	session.setAttribute("user_type_id", command2.getUser_type_id());
	        	session.setAttribute("organization_id", command2.getOrganization_id());

		    //4.파싱 닉네임 세션으로 저장
	        //session.setAttribute("sessionId",nickname); //세션 생성
	        model.addAttribute("result", apiResult);
	        //return "main";
	        return "redirect:/main.do";
	    }
	 
	 //카카오 로그인 & 회원정보 저장
	 @RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	 @ResponseBody
	 public void kakaoLogin(String user_id, String nickname, HttpSession session) {
		 System.out.println("user_id: "+user_id+" nickname: "+nickname);
		 
		
		 int num = gibunigajoaService.signupIdCheck(user_id);
		 if(num == 0) {
			 UserCommand command = new UserCommand();
	        	
	        	command.setUser_id(user_id);
	        	command.setNickname(nickname);
	        	command.setUser_type_id(3);
	        	command.setGrade(0);
	    		command.setRegister_date(new Date(System.currentTimeMillis()));
	    		command.setOrganization_id("");
	    		
	    		int	result= gibunigajoaService.kakaoNaverInsert(command);
	    		
		 }
			 UserCommand command2 = gibunigajoaService.kakaoNaverloginCheck(user_id);
	        	System.out.println("command2: "+command2);
	        	session.setAttribute("user_idx", command2.getUser_idx());	
	        	session.setAttribute("user_id", command2.getUser_id());	
	        	session.setAttribute("nickname", command2.getNickname());	
	        	session.setAttribute("grade", command2.getGrade());	
	        	session.setAttribute("user_type_id", command2.getUser_type_id());
	        	session.setAttribute("organization_id", command2.getOrganization_id());
		 
	 }
	
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String loginCheck(String user_id, String password, HttpSession session) {
		Gson gson = new Gson();
		JsonObject json = new JsonObject();
		int num = 0;
		
		HashMap<String, String> m = new HashMap<String, String>();
		m.put("user_id", user_id);
		m.put("password", password);
		try {
			UserCommand command = gibunigajoaService.loginCheck(m);
			
			session.setAttribute("user_idx", command.getUser_idx());	
			session.setAttribute("user_id", command.getUser_id());	
			session.setAttribute("nickname", command.getNickname());	
			session.setAttribute("grade", command.getGrade());	
			session.setAttribute("user_type_id", command.getUser_type_id());	
			session.setAttribute("organization_id", command.getOrganization_id());
			num = 1;
			json.addProperty("num", num);
			
		}catch (NullPointerException e) {
			num=0;
			json.addProperty("num", num);
		}finally {
			return gson.toJson(json);
		}
		
	}
	
	
	@RequestMapping("/logout.do")
	public String logoutForm(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
	//회원가입 개인, 단체 type에 따라 관련 회원가입 폼으로 보낸다.  
	@RequestMapping(value="/signupCheck.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String signUpForm(int num) {
		String signUpForm="";
		
		if(num == 1) { //개인
			signUpForm = "signUpIndividual";
			
		}else if(num == 2){ //단체
			signUpForm="signUpGroup";
		}
		
		return signUpForm;
	}
	
	//회원가입 ID 중복체크
	@RequestMapping(value="/signupIdCheck.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String signupIdCheck(String user_id) {
		JsonObject json = new JsonObject();
		Gson gson = new Gson();
		
		try {
			int num = 0;
			num = gibunigajoaService.signupIdCheck(user_id);
			json.addProperty("num", num);
		
		}catch (Exception e) {}
		
		return gson.toJson(json);
	}
	
	//개인 회원가입 Insert service로 가는 다리 
	@RequestMapping("/signUp.do")
	public String singnUpSuccess(UserCommand command){
		command.setGrade(0);
		command.setRegister_date(new Date(System.currentTimeMillis()));
		command.setOrganization_id("");
		
		String singnUpSuccess="";
		
		/*
		 * if(command.getUser_id().equals("")) { System.out.println("id 노 입력");
		 * singnUpSuccess = "signupCheck.do?num=1";
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter(); out.
		 * println("<script>alert('ID를 입력하지 않으셨습니다.'); location.href='signupCheck.do?num=1'; </script>"
		 * ); out.flush();
		 * 
		 * }else {}
		 */
			System.out.println("다 입력");
		
			command.setBirthday(contributionCtr.addHour(command.getBirthday()));
			System.out.println("birthday: "+command.getBirthday());
			int result= gibunigajoaService.memberInsert(command);
		  
			if(result > 0) { singnUpSuccess = "redirect:/loginForm.do"; }
		 
		
		
		return singnUpSuccess;
	}
	
	
	/*
	  @RequestMapping(value = "/oauth", produces = "application/json", method = {
	  RequestMethod.GET, RequestMethod.POST }) public String
	  kakaoLogin(@RequestParam("code") String code) {
	  //System.out.println(access_token); return "home"; }
	 
	 @RequestMapping(value="/kakaologin.do")
	 public String kakaoLoginCheck() {
		 return "main";
	 }
	*/
	 @RequestMapping(value="/payment.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	 @ResponseBody
	 public String payment(String contribution, String organization_name, String program_subject, String organization_id, String program_id, HttpSession session){
		 System.out.println("session: "+session.getAttribute("user_idx"));
		 JsonObject json = new JsonObject();
		 Gson gson = new Gson();
		 int jnum =0 ;
		 
		 if(session.getAttribute("user_id") != null) {
			 
		 String idx = String.valueOf(session.getAttribute("user_idx")).trim();
		 int user_idx = Integer.parseInt(idx);
		 System.out.println("user_idx: "+user_idx);
		 ContributionDto command = new ContributionDto();
		 command.setContribution(Integer.parseInt(contribution));
		 command.setOrganization_name(organization_name);
		 command.setProgram_name(program_subject);
		 command.setRegister_type_flg(2);
		 command.setUser_idx(user_idx);
		 command.setDate(new Date(System.currentTimeMillis()));
		 command.setOrganization_id(organization_id);
		 System.out.println("organization: "+organization_id);
		 command.setProgram_id(Integer.parseInt(program_id));
		 System.out.println("program: "+program_id);
		 System.out.println("command: "+command.toString());
		 
		 int num = gibunigajoaService.payInsertContribution(command);
		 int user_type_id = Integer.parseInt(String.valueOf(session.getAttribute("user_type_id")));
		 System.out.println("user_type_id: "+user_type_id);
			 int contributionSum = gibunigajoaService.contributionSum(user_idx); 
			 HashMap<String, Object> m = new HashMap<String, Object>();
			 m.put("user_idx", user_idx);
			 int gradeNum = 0;
			 
			 System.out.println("기부금 체크: "+contributionSum);
			 if(contributionSum >= 100000 && contributionSum < 500000) {
				 System.out.println("기부금 체크 10");
				if(user_type_id != 2) {
					gradeNum = gibunigajoaService.gradeCheck(user_idx);
					 if(gradeNum != 1) {
						 jnum = 10;
						 m.put("grade", 1);
						 gibunigajoaService.updateGrade(m);
					 }
				}
			 
			 }else if(contributionSum >= 500000 && contributionSum < 1000000) {
				 System.out.println("기부금 체크 50");
				 if(user_type_id != 2) {
					 gradeNum = gibunigajoaService.gradeCheck(user_idx);
					 if(gradeNum != 2) {
						 jnum = 50;
						 m.put("grade", 2);
						 gibunigajoaService.updateGrade(m);
					 }
				 }
				 
			 
			 }else if(contributionSum >= 1000000) {
				 System.out.println("기부금 체크 100");
				 if(user_type_id != 2) {
					 
					 gradeNum = gibunigajoaService.gradeCheck(user_idx);
					 if(gradeNum != 3) {
						 jnum = 100;
						 m.put("grade", 3);
						 gibunigajoaService.updateGrade(m);
					 }
				 }
				 
			 }
		 }else {//비회원 기부 일시 
			 
			 ContributionDto command = new ContributionDto();
			 command.setContribution(Integer.parseInt(contribution));
			 command.setOrganization_name(organization_name);
			 command.setProgram_name(program_subject);
			 command.setRegister_type_flg(2);
			 command.setUser_idx(0);
			 command.setDate(new Date(System.currentTimeMillis()));
			 command.setOrganization_id(organization_id);
			 command.setProgram_id(Integer.parseInt(program_id));
			 System.out.println("command: "+command.toString());
			 int num = gibunigajoaService.payInsertContribution(command);
		 }
		 
		 json.addProperty("num", jnum);
		 return gson.toJson(json);
		 
	 }
	 
	 
	 @ExceptionHandler(Exception.class)
	 public ModelAndView handleException(HttpServletRequest request, Exception ex) {
		System.out.println("들어오니?");
	    ModelAndView mv =new ModelAndView("error/exception");
	    System.out.println("Message: "+ex.getMessage());
	    mv.addObject("message", ex.getMessage());
	    return mv;
	 }
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//자동으로 원하는 형식으로 포멧해줌 
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		//true null값 허용, false null값 불허

	}

	public void setContributionCtr(contributionController contributionCtr) {
		this.contributionCtr = contributionCtr;
	}
	
	public void setGibunigajoaService(GibunigajoaService gibunigajoaService) {
		this.gibunigajoaService = gibunigajoaService;
	}
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	

}
