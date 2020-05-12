package contribution.ldk.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import contribution.model.Program;
import contribution.model.ProgramImage;
import contribution.service.programService;

@Controller
public class adminController {

	@Autowired
	programService service;

	public void setService(programService service) {
		this.service = service;
	}

	
	@RequestMapping(value = "/admin/programList.do", method = RequestMethod.GET)
	public ModelAndView selectProgramList() {
		ModelAndView mav = new ModelAndView("programList");
		mav.addObject("programList", service.selectAllProgramList());
		return mav;
	}
	
	@RequestMapping(value = "/admin/showProgramContent.do", method = RequestMethod.GET)
	public ModelAndView showProgramContent(int program_id, String organization_id) {
		ModelAndView mav = new ModelAndView("showProgramContent");
		Program pro = service.getProgramInfo(program_id, organization_id);
		mav.addObject("requestProgram", pro);
		mav.addObject("typeValue", service.selectTypeValue(pro.getType_id()));
		List<ProgramImage> images = service.getProgramBanner(program_id, organization_id);
		mav.addObject("images", images);
		return mav;
	}
	
	@RequestMapping(value = "/admin/updateApprovalFlg.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateApprovalProgram(String organization_id, int program_id, int approval_flg) {
		return service.updateApprovalFlg(organization_id, program_id, approval_flg);
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
