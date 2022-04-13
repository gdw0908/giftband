package com.mc.giftcard.sms;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping(value = "/api/sms")
public class SmsController {

    Logger log = LoggerFactory.getLogger(SmsController.class);
    
	@Autowired
    SmsService smsService;
    
    @RequestMapping(value = "/free/send.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> send(@RequestBody Map<String, Object> param) throws Exception {
    	Map<String, Object> result = new HashMap<>();    	
		String resCode = "0000";
		String resMessage = "정상";

        Map<String, Object> data = new HashMap<>();

        try {
        	data = smsService.send(param, "");
        } catch (Exception e) {
            e.printStackTrace();
        }

		result.put("resCode", resCode);
		result.put("resMessage", resMessage);
    	return result;
    }
}
