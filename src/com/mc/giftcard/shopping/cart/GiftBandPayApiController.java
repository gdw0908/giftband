package com.mc.giftcard.shopping.cart;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mc.common.util.HttpApiUtil;
import com.mc.common.util.StringUtil;
import com.mc.web.Globals;

@Controller
public class GiftBandPayApiController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private Globals globals;
	
	@Autowired
	private GiftCardCartService cartService;
	
	@Autowired
	private GiftCardCartDAO cartDAO;
	
	@Autowired
	private GiftCardCartController cartController;
	
    @Autowired
    private HttpApiUtil httpApiUtil;  
	
	@Value("#{config['vpay.dev.url.midChk']}")
    String vpay_dev_url_midChk;
	
	@Value("#{config['vpay.prod.url.midChk']}")
    String vpay_prod_url_midChk;
	
	private final String tenThusndSeq = "56429"; //기프티콘 1만원권 상품번호
	private final String millionSeq = "56432"; //기프티콘 10만원권 상품번호
	
	//외부에서 URL로 접근하는 페이지 초기화면
    @RequestMapping("/giftband/payInfo.do")	
	public String payInfo(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> params) throws Exception {
    	log.error("");
		log.error("=======/giftband/payInfo.do====param:"+params.toString()+"==========");
		log.error("");
		
		if(StringUtil.isBlank(StringUtil.nvl(params.get("mid")))) {
			request.setAttribute("message", "필수 파라미터 가맹점 mid가 존재하지 않습니다.");
			request.setAttribute("redirect", "/giftcard/index.do");
			return "message";
		}else{
			Map<String, Object> res_result = new HashMap<String, Object>();
			res_result = this.midChk(null, request, session, params);
			if(!"0000".equals(res_result.get("resCode"))) {
				request.setAttribute("message", "올바른 가맹점 ID가 아닙니다.");
				request.setAttribute("redirect", "/giftcard/index.do");
				return "message";	
			}
			session.setAttribute("mid", StringUtil.nvl(params.get("mid"),""));			
    	}
		request.setAttribute("params", params);
    	return "/giftcard/directPay/payInfo";
    }
    
    //외부에서 URL로 접근하는 페이지
    //상품권 구매하기 금액입력
    @RequestMapping("/direct/payEnter.do")	
	public String payEnter(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> params) throws Exception {
    	log.error("");
		log.error("=======/direct/payEnter.do====param:"+params.toString()+"==========");
		log.error("");
		/*String returnurl = "/giftcard/directPay/payEnter";
		MCMap member = (MCMap) session.getAttribute("member");
		if (member == null) {
			returnurl = "/giftcard/directPay/payLogin";
		}*/
		request.setAttribute("params", params);
    	return "/giftcard/directPay/payEnter";
    }
    
    //외부에서 URL로 접근하는 페이지
    //상품권 구매하기 계좌정보입력
    @RequestMapping("/direct/payAcctInfo.do")	
	public String payAcctInfo(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> params) throws Exception {
    	log.error("");
		log.error("=======/direct/payAcctInfo.do====param:"+params.toString()+"==========");
		log.error("");
		params.put("sessionid", session.getId());// 비회원용 세션아이디
		params.put("mid", session.getAttribute("mid"));
		params.put("amt", params.get("amt"));
		//가격에 따른 상품 카트에 담기(비회원 로직)
		BigDecimal amt = new BigDecimal(StringUtil.nvl(params.get("amt"),"0"));
		BigDecimal prodCnt = amt.multiply(new BigDecimal(10000)).divide(new BigDecimal(100000), 1, BigDecimal.ROUND_FLOOR);
		if(prodCnt.floatValue() > 0) {
			String[] splitCnt = prodCnt.toString().split("\\.");
			if(Integer.parseInt(splitCnt[0]) > 0 ) {
				params.put("seq", millionSeq);
				params.put("qty", splitCnt[0]);
				params.put("isDirectOdr", "Y");
				cartService.add_cart(params);
			}
			if(Integer.parseInt(splitCnt[1]) > 0 ) {
				params.put("seq", tenThusndSeq);
				params.put("qty", splitCnt[1]);
				params.put("isDirectOdr", "Y");
				cartService.add_cart(params);
			}
		}
		
		params.put("bankList", cartDAO.bankList(params));
		request.setAttribute("params", params);
		
    	return "/giftcard/directPay/payAcctInfo";
    }
    
    //외부에서 URL로 접근하는 페이지
    //상품권 구매하기 주문완료
    @RequestMapping("/direct/payOrder.do")	
	public String payOrder(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> params) throws Exception {
    	log.error("");
		log.error("=======/direct/payOrder.do====param:"+params.toString()+"==========");
		log.error("");
		if(StringUtil.isBlank(StringUtil.nvl(session.getAttribute("mid"),""))) {
			request.setAttribute("message", "필수 파라미터 가맹점 mid가 존재하지 않습니다.");
			request.setAttribute("redirect", "/giftcard/index.do");
			return "message";
		}else{
			Map<String, Object> res_result = new HashMap<String, Object>();
			params.put("mid", session.getAttribute("mid"));
			res_result = this.midChk(null, request, session, params);
			if(!"0000".equals(res_result.get("resCode"))) {
				request.setAttribute("message", "올바른 가맹점 ID가 아닙니다.");
				request.setAttribute("redirect", "/giftcard/index.do");
				return "message";	
			}
    	}
		
		BigDecimal amt = new BigDecimal(StringUtil.nvl(params.get("amt"),"0"));
		params.put("Amt", amt.multiply(new BigDecimal(10000)).toString() ); //금액 셋팅
		params.put("sessionid", session.getId());
		List<Map<String, Object>> cartList = cartDAO.cart_list(params);
		if(cartList.size() ==0) {
			request.setAttribute("message", "주문수량이 없습니다.");
			request.setAttribute("redirect", "/giftcard/index.do");
			return "message";	
		}
		cartDAO.orderno_create(params);//주문번호생성
		params.put("OrdNo", params.get("orderno"));
		String cart_no[] = new String[cartList.size()];
		for(int i=0; i<cartList.size(); i++) {
			cart_no[i]=StringUtil.nvl(cartList.get(i).get("cart_no"),"");			
		}
		params.put("isDirectOdr", "Y");
		cartController.pay_int(null, request, session, params, null, cart_no, null);
		request.setAttribute("params", params);
		request.setAttribute("resultInfo", cartDAO.orderResultInfo(params));
    	return "/giftcard/directPay/payOrder";
    }
    
    //vpay에 mid존재여부 체크
	@ResponseBody
	@RequestMapping("/vpay/midChk.do")
	@Transactional(rollbackFor = { Exception.class })
	public Map midChk(ModelMap model, HttpServletRequest request, HttpSession session, @RequestParam Map params)
			throws Exception {
		Map<String, Object> res_result = new HashMap<String, Object>();
		String vpay_url_midChk = (globals.DEVELOPE.equals("dev")  ?  vpay_dev_url_midChk : vpay_prod_url_midChk);
		//파라미터 셋팅
		Map<String, Object> sendParam = new HashMap<String, Object>();
		sendParam.put("mid", StringUtil.nvl(params.get("mid"),""));
		res_result = httpApiUtil.vpayApiCall(sendParam, vpay_url_midChk, "");
		
		return res_result;
	}
	
	//vpay에 입금결과 노티받는 API
    @RequestMapping(value = {"/api/payResult.do"}, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> payResultApi(HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
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
    
	//외부에서 URL로 접근하는 페이지
    //로그인 화면
    /*@RequestMapping("/giftband/payLogin.do")	
	public String payLogin(HttpServletRequest request, HttpSession session, @RequestParam Map<String, String> params) throws Exception {
    	log.error("");
		log.error("=======/giftband/payLogin.do====param:"+params.toString()+"==========");
		log.error("");
		
		request.setAttribute("params", params);
    	return "/giftcard/directPay/payLogin";
    }
    
    //로그인 처리
    @RequestMapping("/giftband/payLoginChk.do")	
	public String payLoginChk(HttpServletRequest request, HttpSession session, @RequestParam Map<String, String> params) throws Exception {
    	log.error("");
		log.error("=======/giftband/payLoginChk.do====param:"+params.toString()+"==========");
		log.error("");
		MCMap member = (MCMap) session.getAttribute("member");
		
		params.put("member_id", StringUtil.clearXSS(params.get("member_id"), "").replaceAll("'", "").replaceAll(";", "").replaceAll("-", ""));
		params.put("member_pw", Encryption.stringEncryption(StringUtil.clearXSS(params.get("member_pw"), "").replaceAll("'", "").replaceAll(";", "").replaceAll("-", ""), ""));
		
		//회원 로그인
		member = (MCMap) LoginDAO.getMemberByIdPwUser(params);
		
		if(member == null){
			request.setAttribute("message", "아이디와 비밀번호가 일치하지 않습니다.");
			//request.setAttribute("redirect", "/giftcard/login/login.do?method=login");
			return "message";
		}else{
			LoginDAO.update("member.updateMemberLastLogin", member);
			session.setMaxInactiveInterval(60 * 60);
    		session.setAttribute("member", member);
    		session.setAttribute("sessionCom_nm", (String)member.get("com_seq"));
		}
		request.setAttribute("params", params);
    	return "/giftcard/directPay/payEnter";
    }
        
    //외부에서 URL로 접근하는 페이지
    //회원가입
    @RequestMapping("/giftband/paySignup.do")	
	public String paySignup(HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> params) throws Exception {
    	log.error("");
		log.error("=======/giftband/paySignup.do====param:"+params.toString()+"==========");
		log.error("");
		
		request.setAttribute("params", params);
    	return "/giftcard/directPay/paySignup";
    }*/
	
}
