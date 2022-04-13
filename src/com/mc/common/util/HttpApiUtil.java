package com.mc.common.util;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.LinkedHashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * API 공통 호출 UTIL
 * @author gdw0908
 *
 */
@Component
public class HttpApiUtil {
	Logger log = LoggerFactory.getLogger(this.getClass());	
	
	/**
	 * 셋팅한 JSON 파라미터와 요청 URL만 셋팅하고 호출
	 * @param sendParam : API 요청할 JSON 파라미터 셋팅값
	 * @param requestUrl : 요청 url 
	 * @return
	 * @throws Exception
	 */
	public  Map<String, Object> vpayApiCall(Map<String, Object> sendParam, String requestUrl, String auth_key) throws Exception{
    	HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		if(!StringUtil.isBlank(auth_key)) {
			headers.set("Authorization", auth_key);
		}
		log.error( "Authorization :" + auth_key+ " / url :"+requestUrl +" / sendParam :"+sendParam.toString());
        HttpEntity<Object> entity = new HttpEntity<Object>(sendParam, headers);        
		RestTemplate restTemplate = new RestTemplate();
		Map<String, Object> res = restTemplate.postForObject(requestUrl, entity, LinkedHashMap.class);
		log.error("Api Call result :"+res.toString());		
		return res;
	}
	
}
