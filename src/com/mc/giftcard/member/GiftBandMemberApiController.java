package com.mc.giftcard.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mc.common.util.StringUtil;
import com.mc.common.util.Util;

@Controller
public class GiftBandMemberApiController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GiftCardMemberDAO MemberDAO;
	
	//업체에 요청받는 API
    @RequestMapping(value = {"/giftband/api/memReg.do"}, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> setMemReg(HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
    	log.error("");
		log.error("=======/giftband/api/memberRegist.do====param:"+param.toString()+"==========");
		log.error("");
		
    	Map<String, Object> result = new HashMap<>();    	
		String resCode = "0000";
		String resMessage = "정상";
		if(!Util.isAuthChk(StringUtil.nvl(request.getHeader("Authorization"),""))) {
			log.error("=======적합하지 않은 Authorization 키값 ==== "+StringUtil.nvl(request.getHeader("Authorization"),"")+"==========");
			resCode = "9999";
			resMessage = "적합하지 않은 Authorization 키값";
			result.put("resCode", resCode);
			result.put("resMessage", resMessage);
	    	return result;
		}
		//아이디 mid 
		//이름 company_nm
		//연락처 ceo_cell
		//비밀번호는 ab12345 초기비번으로 설정
		Map<String, String> params = new HashMap<>();
		params.put("member_id",StringUtil.nvl(param.get("mid"),""));
		params.put("member_nm",StringUtil.nvl(param.get("company_nm"),""));
		params.put("cell",StringUtil.nvl(param.get("ceo_cell"),""));
		params.put("member_pw","d59084b66e167f13bef93b1a5d07acd2");
		MemberDAO.insertMemberData(params);
		
		result.put("resCode", resCode);
		result.put("resMessage", resMessage);
    	return result;
    }
	
}
