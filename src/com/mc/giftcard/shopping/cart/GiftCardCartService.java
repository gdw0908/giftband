package com.mc.giftcard.shopping.cart;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.common.util.BarCodeUtil;
import com.mc.common.util.Encryption;
import com.mc.common.util.FileUtil;
import com.mc.common.util.StringUtil;
import com.mc.giftcard.sms.SmsService;
import com.mc.web.Globals;
import com.mc.web.MCMap;
import com.mc.web.mms.MmsService;

@Service
public class GiftCardCartService {
	
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private GiftCardCartDAO cartDAO;
	
	@Autowired
	private GiftCardErpDAO erpDAO;
	
	@Autowired
	private Globals globals;
	
	@Autowired
	private MmsService mmsService;
	
	@Autowired
	private BarCodeUtil barCodeUtil;
	
	@Autowired
	private SmsService smsService;

	
	public Map list(Map params) throws Exception {
		Map rstMap = new HashMap();
		rstMap.put("list", cartDAO.cart_list(params));
		return rstMap;
	}
	
	public Map step2(Map params, String[] cartno_arr) throws Exception {
		Map rstMap = new HashMap();
		cartDAO.orderno_create(params);//주문번호생성

		/*for (String cart_no : cartno_arr) {//재고수량 체크
			params.put("cart_no", cart_no);
			int stock_num = cartDAO.cart_stock_cartno(params);//재고
			int qty = cartDAO.cart_qty_cartno(params);//수량
			if(qty > stock_num){
				rstMap.put("rst", "-1");
				return rstMap;
			}
		}*/
		
		if(!StringUtil.isEmptyByParam(params, "member_seq")){
			rstMap.put("memberInfo", cartDAO.member_info(params));
			rstMap.put("memberBasongji", cartDAO.member_basongji(params));
		}
		List list = cartDAO.chk_cart_list(params);
		if(list.size()<=0){
			rstMap.put("rst", "-2");
			return rstMap;
		}
		rstMap.put("orderno", params.get("orderno"));
		rstMap.put("bankList", cartDAO.bankList(params));
		rstMap.put("list", list);
		return rstMap;
	}
	
	public Map remove_cart(Map params) throws Exception {
		Map rstMap = new HashMap();
		
		List list = (List) params.get("del");
		if(list != null){
			for (int i = 0; i < list.size(); i++) {
				Map m = (Map) list.get(i);
				cartDAO.remove_cart(m);
			}
		}
		rstMap.put("rst", "1");
		return rstMap;
	}
	
	public Map qtyChange(Map params) throws Exception {
		Map rstMap = new HashMap();
		/*int qty = cartDAO.cart_stock(params);
		if(Integer.parseInt((String) params.get("qty")) > qty){
			rstMap.put("rst", "-1");
			rstMap.put("qty", qty);
			params.put("qty", qty);
		}else{
			rstMap.put("rst", "1");
		}*/
		rstMap.put("rst", cartDAO.updateQty(params));
		return rstMap;
	}
	
	public Map changeCod(Map params) throws Exception {
		Map rstMap = new HashMap();
		rstMap.put("rst", cartDAO.changeCod(params));
		return rstMap;
	}
	
	public Map add_cart(Map params) throws Exception {
		Map rstMap = new HashMap();
		params.put("item_seq", params.get("seq"));
		
		/*MCMap mcmap = cartDAO.inquiry_yn(params);
		if(mcmap != null){
			if("Y".equals(mcmap.getStrNull("inquiry_yn"))){
				rstMap.put("rst", "-1");
				rstMap.put("msg", "협의가 필요한 물품입니다.\\n고객센터로 문의 바랍니다.");
				return rstMap;
			}
		}else{
			rstMap.put("rst", "-1");
			rstMap.put("msg", "협의가 필요한 물품입니다.\\n고객센터로 문의 바랍니다.");
			return rstMap;
		}*/
		
		Map cartMap = cartDAO.in_cart(params);
		if(cartMap != null){//이미 같은상품이 장바구니에 담겨있을경우 하나 증가
			if(!"Y".equals(StringUtil.nvl(params.get("isDirectOdr"), "N"))){
				params.put("cart_no", cartMap.get("cart_no"));
				String strQty = StringUtil.nvl((String)cartMap.get("qty"), "0");
				int qty = Integer.parseInt(strQty)+Integer.parseInt(StringUtil.nvl((String)params.get("qty"),"0"));
				params.put("qty", String.valueOf(qty));
	//			cartDAO.add_cartQty(params);
				rstMap = qtyChange(params);
				/*if("-1".equals(rstMap.get("rst"))) {
					rstMap.put("msg","해당 상품의 최대 구매하실수 있는 수량은 " + cartMap.get("qty")+ " 입니다.");
					return rstMap;
				}*/
			} else {
				if(!cartMap.get("qty").equals(params.get("qty"))) {
					params.put("cart_no", cartMap.get("cart_no"));
					rstMap = qtyChange(params);
				}
			}
		}else{
			cartDAO.add_cart(params);
		}
		rstMap.put("rst", "1");
		return rstMap;
	}
	
	public Map direct_order(Map params) throws Exception {
		Map rstMap = new HashMap();
		
		params.put("item_seq", params.get("seq"));
		/*MCMap mcmap = cartDAO.inquiry_yn(params);
		if("Y".equals(mcmap.getStrNull("inquiry_yn"))){
			rstMap.put("rst", "-2");
			rstMap.put("msg", "협의가 필요한 물품입니다.\\n고객센터로 문의 바랍니다.");
			return rstMap;
		}*/
		cartDAO.orderno_create(params);//주문번호생성
		
		Map cartMap = cartDAO.in_cart(params);
		if(cartMap != null){//이미 같은상품이 장바구니에 담겨있을경우
			params.put("cart_no", cartMap.get("cart_no"));
//			cartDAO.add_cartQty(params);
		}else{
			cartDAO.add_cart(params);
		}
		
		params.put("cart_no", params.get("cart_no"));
		/*int stock_num = cartDAO.cart_stock_cartno(params);//재고
		int qty = cartDAO.cart_qty_cartno(params);//수량
		if(qty > stock_num){
			rstMap.put("rst", "-1");
			return rstMap;
		}*/
		
		if(!StringUtil.isEmptyByParam(params, "member_seq")){
			rstMap.put("memberInfo", cartDAO.member_info(params));
			rstMap.put("memberBasongji", cartDAO.member_basongji(params));
		}
		rstMap.put("orderno", params.get("orderno"));
		rstMap.put("list", cartDAO.dir_cart(params));
		rstMap.put("bankList", cartDAO.bankList(params));
 		rstMap.put("rst", "1");
		return rstMap;
	}

	public Map success(Map params) throws Exception {
		Map rstMap = new HashMap();

		logger.info("success : " + params);
		params.put("passwd", Encryption.stringEncryption((String) params.get("passwd"), ""));
		
		String paytyp = (String)params.get("paytyp");
		logger.info("success paytyp: " + paytyp);
		int payamt = Integer.parseInt((String)params.get("payamt"));
		logger.info("success payamt: " + payamt);
		BigDecimal pg_commission = pgCommission(paytyp, payamt);
		logger.info("success pg_commission: " + pg_commission);
		
		params.put("pg_commission", pg_commission.toString());
		
		cartDAO.order_insert(params);
		logger.info("success order_insert ");

		String[] cart_no_arr = (String[])params.get("cart_no_arr");
		logger.info("success cart_no_arr ");
		//String[] msg_arr = (String[])params.get("msg_arr");
		//logger.info("success msg_arr ");
		
		for (int i = 0; i < cart_no_arr.length; i++) {
			String no = cart_no_arr[i];
			//String msg = msg_arr[i];
			//logger.info("success no:" + no + ",msg:"+msg);
			Map map = new HashMap();
			map.put("orderno", params.get("orderno"));//주문번호
			map.put("group_seq", params.get("group_seq"));
			map.put("cart_no", no);
			map.put("zip_cd", params.get("zipcd"));
			map.put("receiver", params.get("receiver"));
			map.put("addr1", params.get("addr1"));
			map.put("addr2", params.get("addr2"));
			map.put("cell", params.get("cell"));
			map.put("tel", params.get("tel"));
			map.put("message", "");
			map.put("qty", cartDAO.cart_qty_cartno(map));
			map.put("amt", cartDAO.actual_amount(map));
			map.put("commission", cartDAO.getCommission(map));
			map.put("paytyp", paytyp);
			map.put("bankCd", params.get("bankCd"));
			map.put("account", params.get("account"));
			/*
			 * if(!paytyp.equals("virtual")){ //문자 보내기 map.put("mmsMessage",
			 * " 상품의 주문 및 결제가 완료 되었습니다."); mmsService.acMMS_cartno(map);
			 * logger.info("success mms"); }
			 */		
			cartDAO.orderCart(map);
			logger.info("success orderCart");
			//cartDAO.minusStock(map);//수량 빼기
			//logger.info("success minusStock");
		}
		if("N".equals(params.get("memberLogin"))){
			//if(!paytyp.equals("virtual")){
				logger.info("success virtual");
				params.put("mmsMessage", "상품의 주문이 완료 되었습니다. 주문번호 : "+params.get("orderno"));
				//mmsService.guestMMS(params);
				logger.info("success guestMMS");
			//}
		}
		return rstMap;
	}

	/**
	 * 
	 * Comment  : PG사 수수료 계산 
	 * @version : 1.0
	 * @tags    : @param paytyp
	 * @tags    : @param payamt
	 * @tags    : @return
	 * @date    : 2015. 4. 9.
	 *
	 */
	private BigDecimal pgCommission(String paytyp, int payamt) {
		BigDecimal pg_commission = new BigDecimal(0);
		
		if(paytyp.equals("card")){
			BigDecimal percent = new BigDecimal(globals.getPG_COMMISSION_CARD1());
			pg_commission = new BigDecimal(payamt).multiply(percent).divide(new BigDecimal(100)).setScale(0, BigDecimal.ROUND_DOWN);
			pg_commission = pg_commission.add(new BigDecimal(globals.getPG_COMMISSION_CARD2()));	//인증비
		}else if(paytyp.equals("iche")){
			if(payamt >= 10000){
				BigDecimal percent = new BigDecimal(globals.getPG_COMMISSION_ICHE1());
				pg_commission = new BigDecimal(payamt).multiply(percent).divide(new BigDecimal(100)).setScale(0, BigDecimal.ROUND_DOWN);
			}else{
				pg_commission = new BigDecimal(globals.getPG_COMMISSION_ICHE2());	//1만원 미만 건당수수료
			}
		}else if(paytyp.equals("virtual")){
			pg_commission = new BigDecimal(globals.getPG_COMMISSION_VIRTUAL());	//건당수수료
		}else if(paytyp.equals("hp")){
			BigDecimal percent = new BigDecimal(globals.getPG_COMMISSION_HP());
			pg_commission = new BigDecimal(payamt).multiply(percent).divide(new BigDecimal(100)).setScale(0, BigDecimal.ROUND_DOWN);
		}
		return pg_commission;
	}
	
	public Map pay_result(Map params) throws Exception {
		Map rstMap = new HashMap();
		params.put("orderno", params.get("rOrdNo"));
	
		rstMap.put("list", cartDAO.orderResultList(params));
		rstMap.put("resultInfo", cartDAO.orderResultInfo(params));
		
		return rstMap;
	}
		
	public Map m_pay_result(Map params) throws Exception {
		Map rstMap = new HashMap();
		params.put("orderno", params.get("orderno"));
		
		rstMap.put("list", cartDAO.orderResultList(params));
		rstMap.put("resultInfo", cartDAO.orderResultInfo(params));
		
		return rstMap;
	}

	public void virAcctResult(HttpServletRequest req, Map params) {
		try {
		List<Map<String, Object>> list = cartDAO.orderWaitList(params);
		String orderNo = null;
		String phoneNo = null;
		for(int i=0; i<list.size(); i++){
			params.put("cart_no", (String)list.get(i).get("cart_no"));
			cartDAO.virAcctResult1(params);
			if("1".equals((params.get("status")))) {
				orderNo = (String)list.get(i).get("orderno");
				String text = (String)list.get(i).get("cart_no")+(String)list.get(i).get("rdealno"); 
				int width = 448;
				int height = 80;
				//String file_path = "D:/work/workspace/giftband/WebContent/upload/barcode/";
				String root = req.getSession().getServletContext().getRealPath("/"); // /WebContent/
				String file_path = root+"upload/barcode/";
				String file_name = "bc_"+text+".png"; 
				FileUtil.createDir(file_path);
				barCodeUtil.getBarCodeImage(text, width, height, file_path, file_name);
				String imagePath1 = root+"upload/board/";
				imagePath1 += (String)list.get(i).get("yyyy")+"/"+(String)list.get(i).get("mm")+"/"+(String)list.get(i).get("uuid");
				String imagePath2 = file_path+file_name;
				barCodeUtil.getImageMerge(imagePath1,imagePath2);
				
				Map<String, Object> smsMap = new HashMap();
				String title="[기프트밴드]결제완료_기프트콘발송";
				String to_number=(String)list.get(i).get("cell");
				phoneNo=(String)list.get(i).get("cell");
				String msg="상품의 주문 및 결제가 완료 되었습니다.\n주문번호 : "+(String)list.get(i).get("orderno")+"\n";
				msg +="상품명 : "+(String)list.get(i).get("productnm")+"\n";
				msg +="구매수량 : "+(String)list.get(i).get("qty")+"\n";
				msg +="총구매금액 : "+StringUtil.getThousand((String)list.get(i).get("total_amt"))+"원\n";
				smsMap.put("title", title);
				smsMap.put("to_number", to_number);
				smsMap.put("msg", msg);	
				smsMap.put("target_seq",orderNo);	
				Map<String, Object> smsRstMap = smsService.send(smsMap, imagePath2);
				
				//sms전송 후 파일삭제 
				FileUtil.deleteFile(imagePath2);				
			}
		}
		if( !StringUtil.isBlank(orderNo)) {
			String title="[기프트밴드]기프트콘 사용완료";
			String msg="해당 상품의 기프트콘 사용 완료 되었습니다. 주문번호 : "+orderNo;
			Map<String, Object> smsMap = new HashMap(); 
			smsMap.put("title", title);
			smsMap.put("to_number", phoneNo);
			smsMap.put("msg", msg);
			smsMap.put("target_seq",orderNo);	
			TimeUnit.SECONDS.sleep(5);
			Map<String, Object> smsRstMap = smsService.send(smsMap, "");
		}
		cartDAO.virAcctResult2(params);
		
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }

	}

	/**
	 * 
	 * Comment  : 결제 완료시 ERP 주문 테이블 인서트 
	 * @version : 1.0
	 * @tags    : @param params
	 * @date    : 2015. 4. 10.
	 *
	 */
	public int erp_order(Map params) throws Exception {
		
		if("partsmoa".equals(globals.getSTORE_ID())){
			//결제완료된 목록 가져오기
			MCMap data = cartDAO.completePay(params);
			
			if(data != null){
				erpDAO.erp_order(data);
				erpDAO.erp_order_upt(data);//업데이트에 트리거 걸린게 있어서 이렇게 처리
				
				List<MCMap> list = cartDAO.completePayList(params);
				for (MCMap map : list) {
					map.put("orderno", data.getStrNull("orderno"));
					erpDAO.erp_orderdtl(map);
					erpDAO.erp_orderdtl_upt(map);//트리거때문에 한번 업데이트 쳐줌
				}
				
			}
			
			/*List<MCMap> list = cartDAO.completePayList(data);
			String orderno = erpDAO.erp_orderno();
			for (MCMap map : list) {
				map.put("orderno", orderno);
				erpDAO.erp_orderdtl(map);
				erpDAO.erp_orderdtl_upt(map);//트리거때문에 한번 업데이트 쳐줌
			}*/
			
			return 1;
		}else{
			return 1;
		}
	}
	
}