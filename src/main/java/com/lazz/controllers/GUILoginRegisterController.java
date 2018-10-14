package com.lazz.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lazz.service.UsersService;
import com.lazz.service.UtilityService;
import com.lazz.service.domain.Users;
import com.lazz.ui.model.AjaxResponseModel;
import com.lazz.ui.model.LoginVO;
import com.lazz.ui.model.UsersModel;
import com.lazz.utils.AppConstants;
import com.lazz.utils.StringUtils;
import com.lazz.utils.ValueO;

@Controller
@RequestMapping("/login")
public class GUILoginRegisterController {
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private UtilityService utilityService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public AjaxResponseModel validateLogin(@RequestBody LoginVO loginVO, 
    		HttpServletRequest request) {
		AjaxResponseModel loginResponseModel = new AjaxResponseModel();
		if( !StringUtils.isEmpty(loginVO.getUsrName()) && !StringUtils.isEmpty(loginVO.getUsrPassword())) {
			Users user = usersService.getUserByIdAndPassword(loginVO.getUsrName(), loginVO.getUsrPassword());
			if( user != null  ) {
				loginResponseModel.setStatusCode(AppConstants.VALID_CODE);
				loginResponseModel.setStatusMessage(AppConstants.VALID);
				
				HttpSession session = request.getSession(true);
				session.setAttribute(AppConstants.USER_SESSION, user);
			} else {
				loginResponseModel.setStatusCode(AppConstants.INVALID_CODE);
				loginResponseModel.setStatusMessage(AppConstants.INVALID);
			}
		} else {
			loginResponseModel.setStatusCode(AppConstants.INVALID_CODE);
			loginResponseModel.setStatusMessage(AppConstants.INVALID);
		}
		
		return loginResponseModel;
    }
	
	@RequestMapping(value="/loginRespond", method=RequestMethod.GET)
	public ModelAndView loginRespond(HttpServletRequest request) {
		String finalGUI = "";
		HttpSession session = request.getSession(false);
		if( session != null ) {
			Users user = (Users)session.getAttribute(AppConstants.USER_SESSION);
			if( user != null  ) {
				if( user.getUserTypes() != null  ) {
					if(  !AppConstants.USER_TYPE_USER.equals(user.getUserTypes().getUtName()) ) {
						finalGUI = "admin";
					}
				}
			}
		}
		
		return new ModelAndView("redirect:/"+finalGUI);
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerView(ModelMap model) {
		List<ValueO> states = utilityService.getMalaysiaStates();
		model.addAttribute("states",StringUtils.convertListToMap(states));
		model.addAttribute("usersmodel", new UsersModel());
		return "register";
	}
	
	@RequestMapping(value="/register-create", method=RequestMethod.POST)
	public String registerCreate(@ModelAttribute("usersmodel")UsersModel usersModel, 
    	      BindingResult result, ModelMap model, HttpServletRequest request) {
		String finalGUI = "index";
		if(usersModel.getUserDetails() !=null &&
				!StringUtils.isEmpty(usersModel.getUserDetails().getUsrdFullName()) 
				&& !StringUtils.isEmpty(usersModel.getUserDetails().getUsrdMob()) 
				&& !StringUtils.isEmpty(usersModel.getUserDetails().getUsrdEmail())
				&& !StringUtils.isEmpty(usersModel.getUserDetails().getUsrdShpAddr1())
				&& !StringUtils.isEmpty(usersModel.getUserDetails().getUsrdState())
				&& !StringUtils.isEmpty(usersModel.getUserDetails().getUsrdPostCode())
				&& !StringUtils.isEmpty(usersModel.getUsrPassword()) 
				&& !StringUtils.isEmpty(usersModel.getUsrConfirmPassword())) {
			if( usersModel.getUsrPassword().equals(usersModel.getUsrConfirmPassword()) ) {
				boolean isEmailUnique = usersService.
		 				isEmailIdExists(usersModel.getUserDetails().getUsrdEmail());
				if( isEmailUnique ) {
					Users user = new Users();
					user.setUserTypes(usersService.getUserTypeByType(AppConstants.USER_TYPE_USER));
					user.setUsrCrtdDt(new Date());
					user.setUsrUptdDt(new Date());
					//user.setUsrdCity(usrdCity);
					user.setUsrdEmail(usersModel.getUserDetails().getUsrdEmail());
					user.setUsrName(usersModel.getUserDetails().getUsrdEmail());
					user.setUsrdFullName(usersModel.getUserDetails().getUsrdFullName());
					user.setUsrdMob(usersModel.getUserDetails().getUsrdMob());
					user.setUsrdPostCode(usersModel.getUserDetails().getUsrdPostCode());
					user.setUsrdShpAddr1(usersModel.getUserDetails().getUsrdShpAddr1());
					user.setUsrdShpAddr2(usersModel.getUserDetails().getUsrdShpAddr2());
					user.setUsrdPostCode(usersModel.getUserDetails().getUsrdPostCode());
					user.setUsrdState(usersModel.getUserDetails().getUsrdState());
					user.setUserGroups(usersService.getUserGroupByGrpCd(AppConstants.USER_TYPE_USER));
					user.setUsrPassword(usersModel.getUsrConfirmPassword());
					try {
						usersService.createOrUpdateUser(user);
						HttpSession session = request.getSession(true);
						session.setAttribute(AppConstants.USER_SESSION, user);
						//add a variable in the request to determine from where the 
						//request is coming since request can come from cart (when user want 
						//to checkout without logging), simple registration etc 
						String requestFrom = request.getParameter("from");
						if( !StringUtils.isEmpty(requestFrom) ) {
							finalGUI = requestFrom;
						}
					}catch(Exception e) {
						System.out.println("Error : from LoginResgisterController registerCreate");
						e.printStackTrace();
					}
				}
			} else {
				//raise validation password and confirm password mismatch
				finalGUI = "index";
			}
		} else {
			//raise validation mandatory fields missing
			finalGUI = "index";
		}
		
		return finalGUI;
	}
}
