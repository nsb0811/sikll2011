package contribution.kms.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.annotations.JsonAdapter;

import contribution.model.BookmarkDto;
import contribution.model.FileUploadOrganization;

import contribution.model.GroupUserCommand;
import contribution.model.OrganizationLogosDto;
import contribution.model.Page;
import contribution.model.Program;
import contribution.model.ResponseList;
import contribution.modelcount.ResponseCount;
import contribution.modelone.ResponseOne;
import contribution.service.BookmarkService;
import contribution.service.DetailOrganizationService;
import contribution.service.GroupUserService;

@Controller
public class ResponseController {

	//검색어에 따른 리스트 뿌려주는 공공데이터url
	String url = "http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrSearchWordGrpList";
	//서비스키
	String serviceKey = "?ServiceKey=OoQE1Tuy5qcIaGlrTrOm1540TFfC5bkZCTya7G3YDd13DNpFxMB7y1LYcYr4xCThRKiqvp81fEGfk4N8JYkkrA%3D%3D";
	//한페이지에 모든결과수 가져오기 (필요없는데 혹시몰라서)
	String alldata = "&numOfRows=3127";
	//공공데이터에 몇번페이지를 볼껀지 
	String pageNo = "&pageNo=";
	//공공데이터에 검색어
	String keyword = "&keyword=";
    //한페이지에 6개의 결과수만 보여주겟다
	String numOfRows="&numOfRows=6";
    //기부단체 상세조회에 등록번호 입력
	String progrmRegistNo = "&progrmRegistNo=";
    //등록번호에 따른 상세화면뿌려주는 공공데이터url
	String nanmmbyNmurl = "http://openapi.1365.go.kr/openapi/service/rest/ContributionGroupService/getCntrGrpInfo";
	//이거아직잘모르겠습니다 죄송합니다
	RestTemplate resTemplate;
    //즐겨찾기관련 dao
	BookmarkService dao;
	//단체회원관련 dao
	GroupUserService gusdao;
	//공공데이터에없는 상세화면 을 우리쪽 db에 넣어주고 뿌려주는 dao
	DetailOrganizationService dosdao;
	//이미지 업로드할때 잠시 빌려쓴 file
	FileUploadOrganization file = new FileUploadOrganization();
	
	@Autowired //검새결과 없어서 400오류뜨는 상세화면 기부단체 Dao주입
	public void setDosdao(DetailOrganizationService dosdao) {
		this.dosdao=dosdao;
	}
	
	
    @Autowired  //단체회원가입 Dao 주입
	public void setGusdao(GroupUserService gusdao) {
		this.gusdao = gusdao;
	}

	
	@Autowired //즐겨찾기 Dao 주입
	public void setDao(BookmarkService dao) {
		this.dao = dao;
	}

	@Autowired 
	public void setResTemplate(RestTemplate resTemplate) {
		this.resTemplate = resTemplate;
	}
   
	//전체리스트 뿌려주기위한 컨트롤러 처음 들리는곳
	//curPage는 현재페이지고 기본값은 1 
	//search는  검색어에 입력한값 기본값은 "" 처음들리는곳이기때문에 기본값이""이면 전체를 뿌려줌 즉 검색어에 아무것도 입력안한상태로 검색을누르면 전체리스트뿌려줌
	//organization_id는 등록번호
	@RequestMapping(value = "/response.do")
	public String getResponse(Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "") String search, HttpSession session, String organization_id) {
        
		//로그인을 한다면 즐겨찾기 보여주고 안하면 보여주지 않음
		//처음 if는 session에 값이 없을경우 오류가 생겨서 걸어줌
		if(session.getAttribute("user_type_id")!=null) {
			//단체회원으로 할시 즐겨찾기 안보여주기위해 받아옴
		int type_id = (Integer) session.getAttribute("user_type_id");
		//세션에 id값이 있어야하고  type_id가 2가 아닐경우 즉 로그인상태이거나 로그인한 사람이 단체회원이 아닌경우 실행
		if(session.getAttribute("user_idx") != null && type_id !=2) {
		// jsp에 즐겨찾기를 주기위해 변수 선언
		int	x = 1;
		//해당 유저에 즐겨찾기를뽑기위해  해당회원유니크를 세션에서  뽑아냄
		int idx = (Integer)session.getAttribute("user_idx");
		//해당유저가 즐겨찾기한 기부단체 유니크키(등록번호)를받아옴 여러개등록했을수도있으니 list로 받아옴
		List<BookmarkDto> bookmarkList = dao.selectBookmarkDto(idx); 
		//유저가 즐겨찾기한 등록번호만 받아서 뿌려줌
		model.addAttribute("bookmarkId", bookmarkList);
		//로그인한상태이거나 단체회원이 아닐경우 R2를 1로 주고 jsp에 뿌려줌
		model.addAttribute("R2",x);
		}
		}
		//키워드에따른 검색결과수 확인하기 (하나이면 list에 넣어주면안되고 검색결과가 0인경우 400이뜨는에러방지)
		ResponseCount responsecount = resTemplate.getForObject(url + serviceKey + keyword + search,
				ResponseCount.class);
          //검색결과수 변수에저장
		int count = responsecount.getResponse().getBody().getTotalCount();
		//페이징처리
		Page page = new Page(count, curPage);
		int i;
		//검색결과수가 1과 같으면 list에 안들어가기때문에 ResponseOne Dto사용
		if (count == 1) {
			ResponseOne list1 = resTemplate.getForObject(url + serviceKey +numOfRows+pageNo + curPage + keyword + search,
					ResponseOne.class);
			i = 1;
			model.addAttribute("rep", list1);
			model.addAttribute("R", i);
			
			//검색결과가 하나인경우는 db에 저장한 이미지 이름이 그냥 꺼내와서 매칭가능
String Stored_file_name= gusdao.selectStored_file_name(list1.getResponse().getBody().getItems().getItem().getNanmmbyId());
			
			model.addAttribute("banner",Stored_file_name);
			
	    //검색 결과수가 1보다 많으면 여러개받아 list에 넣어줘야하기때문에 ResponseList Dto사용
		} else if (count > 1) {
			ResponseList list1 = resTemplate.getForObject(url + serviceKey +numOfRows +pageNo + curPage + keyword + search,
					ResponseList.class);
			
		
			 //검색결과가 여러개인경우 공공데이터의 등록번호와 db에저장한 이미지테이블에 유니크키와 매칭시켜줘야되므로 반복후 있을경우 아예 itemDto에 변수를 추가해줌
			for(int x = 0; x<list1.getResponse().getBody().getItems().getItem().size(); x++) { 
				list1.getResponse().getBody().getItems().getItem().get(x).setStored_file_name(gusdao.selectStored_file_nameList(list1.getResponse().getBody().getItems().getItem().get(x).getNanmmbyId()));
				
			}
			
          
			
			 
			
			i = 0;
			model.addAttribute("rep_List", list1);
			model.addAttribute("R", i);
			//검색 결과수가 아예없으면  i변수에 2 리턴해서 jsp에 검색결과없음 띄어주기
		} else { 
			i = 2;

			model.addAttribute("R", i);
		}
	
		
		
	
        //검색했을때 선택한 페이지 그대로 유지해야하기때문에  검색한 키워드 다시들고감
		model.addAttribute("search", search);
        //페이지 계산해서 jsp로 들고감
		model.addAttribute("Page", page);
		

		return "blog";
	}
//기부단체 상세화면 
	@RequestMapping("/board.do")
	public String getBoard(Model model, String nanmmbyId,HttpSession session) {
		if(session.getAttribute("user_type_id")!=null) {
		int type_id = (Integer) session.getAttribute("user_type_id");
      //로그인하지않으면 즐겨찾기 숨기고 로그인을했으면 즐겨찾기 보여주기
		if(session.getAttribute("user_idx") != null && type_id !=2) {
			
			int	x = 1;
			int idx = (Integer)session.getAttribute("user_idx");
			
			int chk = dao.DetailBookmarkChk(idx, nanmmbyId);
			
			model.addAttribute("chk", chk);
			
			model.addAttribute("R2",x);
			}
		
		} 
		//상세화면은 0인경우 400이나서  검색결과수 검색
		ResponseCount responsecount = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
				ResponseCount.class);

		int count = responsecount.getResponse().getBody().getTotalCount();
		int i;
		//검색결과가 없으면 400이 뜨는오류때문에 1개의 검색결과와 0개의 검색결과를 나눔(검새결과가 무조건 1개 아니면 0개이다.)
		//검색결과가 1인경우 공공데이터에서 받아온 값 jsp로 넘겨주기 0개인경우 우리쪽DB에 추가한데이터가있을수도있으니 우리쪽DB에서 뿌려줌
		if (count == 1) {
         
			ResponseOne list = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + nanmmbyId,
					ResponseOne.class);

			i = 1;

			model.addAttribute("rep_list", list);
			model.addAttribute("R", i);
			//db에있는 이미지 이름 불러오기
			String Stored_file_name= gusdao.selectStored_file_name(nanmmbyId);
			
			model.addAttribute("banner",Stored_file_name);
			
			
			
			//공공데이터받아온 String타입의 설립일을 중간중간에 년월일 추가시키기 
			if(!list.getResponse().getBody().getItems().getItem().getFondDe().isEmpty()) {
	  		      String str = list.getResponse().getBody().getItems().getItem().getFondDe();
	  		      StringBuffer sb=new StringBuffer(str);
	  		      sb.insert(4, "년 ");
	  		      sb.insert(8, "월 ");
	  		      sb.insert(12,"일");
	  		      model.addAttribute("date",sb);
			}
			 

		} else {
			//검색결과가 없는 애들은  DB에저장한 기부단체상세값  jsp로 넘겨주기
	        
			//우리쪽 db에있으면 데이터 리턴받고 없으면 비어있는객체 리턴받음
			GroupUserCommand list =dosdao.Detail(nanmmbyId);
             //우리쪽 DB에 추가안한(회원가입) 기부단체 상세도 있을수 있으니 확인
			
			//우리쪽DB에 데이터가 있을경우 상세화면뿌려줌 
			if(list.getOrganization_id()!=null) {
				String Stored_file_name= gusdao.selectStored_file_name(nanmmbyId);
				
				model.addAttribute("banner",Stored_file_name);
			  i = 0;
				model.addAttribute("R", i);
	            model.addAttribute("rep_list", list);

		  }else {
			  //만약 우리쪽 화면에도없을경우 이미지파일이름만 리턴해줌 그냥넣은거임 아예준비중이라고 띄울꺼임
			  String Stored_file_name= gusdao.selectStored_file_name(nanmmbyId);
				
				model.addAttribute("banner",Stored_file_name);
			  i=2;
			  model.addAttribute("R", i);
		  }
			
			
			
        
            //우리쪽DB에서 받아온 String타입의 설립일을 중간중간에 년월일 추가시키기 
        	if(list.getFondDe() != null) {
    		      String str = list.getFondDe();
    		      StringBuffer sb=new StringBuffer(str);
    		      sb.insert(4, "년 ");
    		      sb.insert(8, "월 ");
    		      sb.insert(12,"일");
    		      model.addAttribute("date",sb);
        	}
            
            
		}
		//해당 list가 있으면 해당단체에 모집프로그램이있다는뜻이고 list가 비어있다면 해당단체에 모집프로그램이없다는뜻
		List<Program> list = dosdao.DetailProgram(nanmmbyId);
		if(list.size()!=0) {
			i=1;
			model.addAttribute("program", list);
			model.addAttribute("R1", i);
		}else {
			i=0;
			model.addAttribute("R1", i);
		}
		
		return "about";

	}
	//기부단체 회원가입시 검색결과에 리스트뿌려주기
	@RequestMapping(value = "/searchOrganiztion.do",method = RequestMethod.GET)
	
	public String searchOrganization(Model model,String nanmmByNm,@RequestParam(defaultValue = "1") int curPage) {
		
	
		
		ResponseCount responsecount = resTemplate.getForObject(url + serviceKey + keyword + nanmmByNm,
				ResponseCount.class);

		
		
		int count = responsecount.getResponse().getBody().getTotalCount();
		Page page = new Page(count, curPage);
		int i;
		if (count == 1) {
			ResponseOne list1 = resTemplate.getForObject(url + serviceKey +numOfRows+pageNo + curPage + keyword + nanmmByNm,
					ResponseOne.class);
			i = 1;
			model.addAttribute("rep", list1);
			model.addAttribute("R", i);
			//String타입으로들어
		
			
		} else if (count > 1) {
			ResponseList list1 = resTemplate.getForObject(url + serviceKey +numOfRows +pageNo + curPage + keyword + nanmmByNm,
					ResponseList.class);
			i = 0;
			model.addAttribute("rep_List", list1);
			model.addAttribute("R", i);
		} else { 
			i = 2;

			model.addAttribute("R", i);
		}
	
		//페이징 처리하기위해 검색한 키워드 들고감
		model.addAttribute("nanmmByNm", nanmmByNm);

		model.addAttribute("Page", page);
		
		 
		//타일즈 헤더 풋터 필요없기때문에 앞에 경로 붙여줌
	return "organization/response";
	}
	
	//즐겨찾기 컨트롤러
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.POST)
	@ResponseBody
	//로그인한 세션값 idx와 등록번호 받아오기
	public String getBoomark(Model model,HttpSession session,
			String organization_id,String nanmmbyNm )throws Exception {
		
	//세션에 idx만 캐스팅후 변수에저장
		int idx = (Integer)session.getAttribute("user_idx"); 
		//dao에서 인서트인지 딜리트인지 검사한후 인서트 아니면 딜리트 시켜줌 인서트면 1 딜리트면 0 리턴받아옴 ajax에서 text리턴받아서 String 타입으로 캐스팅함
		String i =dao.insertOrDelete(idx, organization_id ,nanmmbyNm)+"";
	 
		return i;
		
	}
	//단체회원가입 컨트롤러
	@RequestMapping(value = "GroupUserSignup.do",method=RequestMethod.POST)
	public String GroupUser(Model model,GroupUserCommand guc,@RequestParam("banner") MultipartFile banner,HttpServletRequest request) {
		
		if(banner.getOriginalFilename()!="") {
		 
		//파일업로드
		String root = request.getServletContext().getRealPath("resources/images/");
		System.out.println(root);
		String stored_file_name ="";
		String original_file_name="";
		String organization_id= guc.getOrganization_id();
		
		Map<String,String> fileInfo =file.bannerImageUpload(banner, organization_id, root);
		stored_file_name = fileInfo.get("stored_file_name");
		original_file_name = fileInfo.get("original_name");
         int i1;
       //단체회원가입시 이미지테이블에 이미지 추가하기
         i1 = gusdao.InsertOrganization_logo(organization_id, original_file_name, stored_file_name, root);
		}
		
		//현재시간 저장
		guc.setRegister_date(new Date(System.currentTimeMillis()));
		int i;
		//인서트
		  i = gusdao.insertOrganizations(guc);
		model.addAttribute("R",i);
		 
		 return "groupPro";
		 
	}
	
	public int getOrganizationCntInfo(String organization_id) {
		ResponseCount responseCount = resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + organization_id,
				ResponseCount.class);
		//검색결과의 카운트 확인 ->1 : 공공데이터로 가능
		//				  ->0 : 공공데이터에서 세팅 불가 ->DB에서 확인
		return responseCount.getResponse().getBody().getTotalCount();

	}
	
	public ResponseOne getOrganizationInfo(String organization_id) {
		/*
		 * ResponseCount responseCount = resTemplate.getForObject(nanmmbyNmurl +
		 * serviceKey + progrmRegistNo + organization_id, ResponseCount.class);
		 */
		/*
		 * ModelAndView mav = new ModelAndView(); //검색결과의 카운트 확인 ->1 : 공공데이터로 가능 // ->0
		 * : 공공데이터에서 세팅 불가 ->DB에서 확인 int count =
		 * responseCount.getResponse().getBody().getTotalCount(); if(count == 1) {
		 * ResponseOne organizationInfo =
		 * 
		 * mav.addObject("organizationInfo", organizationInfo);
		 * mav.addObject("returnType", 1); }else { mav.addObject("returnType", 2); }
		 */

		return resTemplate.getForObject(nanmmbyNmurl + serviceKey + progrmRegistNo + organization_id,
				ResponseOne.class);
	}
	
	//처음 단체회원 수정 들어가면 해당 아이디에대한 정보를뿌려주기위해 컨트롤러 들렸다 가게끔 세팅함
	@RequestMapping("updateGroupForm.do")
	public String updateGroupform(HttpSession session,Model model) {
		//세션값이 있는경우에만 들어올수가있으니 if안걸어놓음
		//해당 단체유저가가지고있는 등록번호 꺼내옴
		String organization_id =(String) session.getAttribute("organization_id");
		//해당 단체유저가가지고있는 유저테이블에 유니크키 꺼내옴
		int user_idx= (Integer)session.getAttribute("user_idx");
		//단체회원수정에 이미 로고가있는경우 보여주기위해 dto 생성하고 넣어주기위한 용도
		OrganizationLogosDto dto;
		//해당 단체유저가 가지고있는 이미지파일 넣어주기
		dto = gusdao.selectLogo(organization_id);
		//단체회원수정에 회원이가지고있는 값들 value로 뿌려주기위한 용도
		GroupUserCommand guc;
		//해당 단체유저가 가지고있는 유저데이터 가져옴
		guc = gusdao.selectUserAll(user_idx);
		model.addAttribute("organization_id", organization_id);
		model.addAttribute("organization", dto);
        model.addAttribute("user",guc);
		
		
		return "GroupUpdate";
		
	}
	
	
	
	
	//단체아이디 수정
	@RequestMapping(value = "GroupUser.do" ,method = RequestMethod.POST)
	public String updateUser(HttpSession session,GroupUserCommand guc,MultipartFile banner,HttpServletRequest request) {
		int user_idx= (Integer)session.getAttribute("user_idx");
		//이미지파일이 비어있지 않은경우 즉 아무것도안넣을경우를 대비
		if(!banner.isEmpty()) {
			String root = request.getServletContext().getRealPath("resources/images/");
			System.out.println(root);
			String stored_file_name ="";
			String original_file_name="";
			String organization_id= guc.getOrganization_id();
			
			Map<String,String> fileInfo =file.bannerImageUpload(banner, organization_id, root);
			stored_file_name = fileInfo.get("stored_file_name");
			original_file_name = fileInfo.get("original_name");
	         int i1;
	         //해당 단체유저가 이미지파일이 이미있는경우 딜리트후 인서트 이미지파일이없는경우는 인서트만 해줌
	         i1 = gusdao.InsertorDelete(organization_id, original_file_name, stored_file_name, root);
			
		}
		String password = guc.getPassword();
		String nickname = guc.getNickname();
		String user_id = guc.getUser_id();
		//단체회원이 유저테이블 수정해주기 테이블이 따로있기 때문에 변수를 따로빼줌
		gusdao.updatelogo(user_idx, password, nickname, user_id); 
		
		//수정이끝나면 메인으로 돌아가기
		return "redirect:/main.do";
		
		
	}
	//만약 단체수정폼에서 이미지파일에 x의 a태그를 클릭할경우 이쪽으로와서 딜리트 시켜줌
	@RequestMapping(value = "deleteBanner1.do",method = RequestMethod.POST)
	@ResponseBody
	public int deleteLogo(String organization_id) {
		
		
		//딜리트 이미지파일
		return gusdao.deleteLogo(organization_id);
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
