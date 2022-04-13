package com.mc.giftcard.sms;
import java.util.Map;
import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository
public class SmsDao extends EgovAbstractMapper {
	
	public int insert(Map<String, Object> param) {
		return update("sms.insert", param);
	}
}
