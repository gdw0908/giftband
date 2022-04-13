package com.mc.giftcard.shopping.cart;

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
public class GiftBandPayApiController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private GiftCardCartService cartService;
	
	//vpay에 입금결과 노티받는 API
    @RequestMapping(value = {"/giftband/api/payResult.do"}, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> setMemReg(HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
    	log.error("");
		log.error("=======/giftband/api/payResult.do====param:"+param.toString()+"==========");
		log.error("");
		
    	Map<String, Object> result = new HashMap<>();    	
		String resCode = "0000";
		String resMessage = "정상";
		//top_orderid (issueId)
		//tid (vactId)
		Map<String, String> setParam = new HashMap<>();
		setParam.put("rdealno",StringUtil.nvl(param.get("top_orderid"),""));
		setParam.put("rapprno",StringUtil.nvl(param.get("tid"),""));
		setParam.put("rapprtm",StringUtil.nvl(param.get("com_dt"),""));
		setParam.put("status",StringUtil.nvl(param.get("status"),""));
		cartService.virAcctResult(request, setParam);
		
		result.put("resCode", resCode);
		result.put("resMessage", resMessage);
    	return result;
    }
	
}
