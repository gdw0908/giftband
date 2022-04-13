package com.mc.giftcard.sms;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.mc.common.util.StringUtil;

@Service
public class SmsService {
	
	//private Logger log = LoggerFactory.getLogger(SmsService.class);
	
	@Value("#{config['aligo.user_id']}")
    String aligo_user_id;
	
	@Value("#{config['aligo.key']}")
    String aligo_key;
	
	@Value("#{config['aligo.sender']}")
    String aligo_sender;
	
	@Value("#{config['aligo.kakao.senderkey']}")
    String aligo_kakao_senderkey;
	
	
	@Value("${apiStore.sender}")
    String apiStore_sender;
	
	@Value("${apiStore.key}")
    String apiStore_key;
	
	@Value("${apiStore.clientId}")
    String apiStore_clientId;
	
	
    @Autowired
    SmsDao smsDao;
	
	public Map<String, Object> send(Map<String, Object> param, String image) throws Exception{
		
		Map<String, Object> rtn = new HashMap<String, Object>();
		
		String title = (String)param.get("title");
		String to_number = (String)param.get("to_number");
		String msg = (String)param.get("msg");
		
        try {
            
            rtn = AligoSmsUtil.send(aligo_user_id, aligo_key, msg, title, to_number, aligo_sender, image);
            //System.out.println("=========to_number:"+to_number+"=========rtn:"+rtn.toString()+"==================");
            param.put("result_code", rtn.get("resultCode"));
            param.put("result_msg", rtn.get("resultMsg"));
            param.put("msg_id", StringUtil.nvl(rtn.get("msg_id"),"mid_fail"));
            param.put("mid", StringUtil.nvl(rtn.get("msg_id"),"mid_fail"));
            smsDao.insert(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		return rtn;
	}
	
	public Map<String, Object> send_apistore_kakao_alim_talk(Map<String, Object> param) throws Exception{
		
		Map<String, Object> rtn = new HashMap<String, Object>();

		String template_code = (String)param.get("template_code");
		String title = (String)param.get("title");
		String to_number = (String)param.get("to_number");
		String msg = (String)param.get("msg");
		
		String url = "http://api.apistore.co.kr/kko/1/msg/" + apiStore_clientId;
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("phone", to_number));					//수신할 핸드폰번호
		params.add(new BasicNameValuePair("callback", apiStore_sender));		//발신자 전화번호
		//sendParam.put("reqdate", reqdate);									//발송시간
		params.add(new BasicNameValuePair("msg", msg));							//전송할 메세지
		params.add(new BasicNameValuePair("template_code", template_code));		//카카오 알림톡 템플릿코드
		params.add(new BasicNameValuePair("failed_type", "SMS"));				//실패시 전송할 메세지 타입
		params.add(new BasicNameValuePair("failed_subject", title));			//실패시 전송할 제목
		params.add(new BasicNameValuePair("failed_msg", msg));					//실패시 전송할 메세지
		
		if(param.containsKey("btn_txt")) {
			String btn_type = (String)param.get("btn_type");	
			String btn_txt = (String)param.get("btn_txt");		
			String btn_url1 = (String)param.get("btn_url1");	
			String btn_url2 = (String)param.get("btn_url2");
			
			params.add(new BasicNameValuePair("btn_types", btn_type));			//알림톡 버튼 타입(웹링크, 앱링크, 봇키워드, 메시지전다르 배송조회)
			params.add(new BasicNameValuePair("btn_txts", btn_txt));			//알림톡 버튼 이름
			params.add(new BasicNameValuePair("btn_urls1", btn_url1));			//알림톡 버튼 url1
			params.add(new BasicNameValuePair("btn_urls2", btn_url2));			//알림톡 버튼 url2
		}
		
		
		Map<String, Object> sendParam = new HashMap<String, Object>();
		sendParam.put("phone", to_number);
		sendParam.put("callback", apiStore_sender);
		//sendParam.put("reqdate", reqdate);
		sendParam.put("msg", msg);
		sendParam.put("template_code", template_code);
		sendParam.put("failed_type", "N");
		//sendParam.put("failed_subject", title);
		//sendParam.put("failed_msg", msg);
		
		if(param.containsKey("btn_txt")) {
			String btn_type = (String)param.get("btn_type");
			String btn_txt = (String)param.get("btn_txt");
			String btn_url1 = (String)param.get("btn_url1");
			String btn_url2 = (String)param.get("btn_url2");
			
			sendParam.put("btn_types", btn_type);
			sendParam.put("btn_txts", btn_txt);
			sendParam.put("btn_urls1", btn_url1);
			sendParam.put("btn_urls2", btn_url2);
		}
		try {
			//System.out.println("=============sendParam:"+sendParam.toString()+"==============");
			int connectTimeout = 2000;
			URI uri = new URI(url);
	        uri = new URIBuilder(uri).build();
			HttpClient httpClient = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost();
			post.addHeader("x-waple-authorization", apiStore_key);

			post.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			post.setConfig(RequestConfig.custom().setConnectTimeout(connectTimeout).setConnectionRequestTimeout(connectTimeout).setSocketTimeout(connectTimeout).build());
			post.setURI(uri);
			HttpResponse response = httpClient.execute(post); 
			org.apache.http.HttpEntity entity = response.getEntity();
			String r = EntityUtils.toString(entity);
    		r = r.trim();
			rtn = (JSONObject) new JSONParser().parse(r);
			
			//System.out.println("=============rtn:"+rtn.toString()+"==============");
    		String msg_id = "";
    		String resultCode = "0000";
    		String result_msg = StringUtil.nvl(rtn.get("result_message"), "");
    		String code = (String)rtn.get("result_code");
    		if(code.equals("200")) 
    			msg_id = (String)rtn.get("cmid");
    		else
    			resultCode = code;
    		
    		
    		rtn.put("resultCode", resultCode);
    		
    		param.put("result_code", resultCode);
            param.put("result_msg", result_msg);
            param.put("msg_id", msg_id);
            param.put("send_type", "K");
            smsDao.insert(param);
            
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return rtn;
	}
	
	public Map<String, Object> send_aligo_kakao_alim_talk(Map<String, Object> param) throws Exception{
		
		Map<String, Object> rtn = new HashMap<String, Object>();
		
		String tpl_code = (String)param.get("tpl_code");
		String title = (String)param.get("title");
		String to_number = (String)param.get("to_number");
		String ord_nm = (String)param.get("ord_nm");
		String msg = (String)param.get("msg");
		
		Map<String, Object> aligo_kakao_token_map = get_aligo_kakao_token();
		String token = (String)aligo_kakao_token_map.get("token");
		
		if(token != null){
			
			String url = "https://kakaoapi.aligo.in/akv10/alimtalk/send/";
			
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			params.add(new BasicNameValuePair("apikey", aligo_key));				//인증용 API Key
			params.add(new BasicNameValuePair("userid", aligo_user_id));			// 사용자id
			params.add(new BasicNameValuePair("token", token));						//생성한 토큰
			params.add(new BasicNameValuePair("senderkey", aligo_kakao_senderkey));	//발신프로파일 키
			params.add(new BasicNameValuePair("tpl_code", tpl_code));				//템플릿 코드
			//params.add(new BasicNameValuePair("sender", aligo_center_sender));		//발신자 연락처
			params.add(new BasicNameValuePair("sender", aligo_sender));		//발신자 연락처
			//params.add(new BasicNameValuePair("senddate", senddate));				//예약일
			params.add(new BasicNameValuePair("receiver_1", to_number));			//수신자 연락처
			params.add(new BasicNameValuePair("recvname_1", ord_nm));				//수신자 이름
			params.add(new BasicNameValuePair("subject_1", title));					//알림톡 제목
			params.add(new BasicNameValuePair("message_1", msg));					//알림톡 내용
			params.add(new BasicNameValuePair("failover", "Y"));					//실패시 대체문자 전송기능
			params.add(new BasicNameValuePair("fsubject_1", title));				//실패시 대체문자 제목
			params.add(new BasicNameValuePair("fmessage_1", msg));					//실패시 대체문자 내용
			
			if(param.containsKey("btn_txt")) {
				
				String btn_txt = (String)param.get("btn_txt");		//알림톡 버튼 이름
				String btn_cd = (String)param.get("btn_cd");		//알림톡 버튼 타입 코드(DS, WL, AL, BK, MD)
				String btn_type = (String)param.get("btn_type");	//알림톡 버튼 타입 텍스트(배송조회, 웹링크, 앱링크, 봇키워드, 메시지전달)
				String btn_url1 = (String)param.get("btn_url1");	//알림톡 버튼 url1	
				String btn_url2 = (String)param.get("btn_url2");	//알림톡 버튼 url2
				
				String button_1 = "";
				button_1 += "{";
				button_1 += "    \"button\": [{";
				button_1 += "        \"name\" : \""+btn_txt+"\",";
				button_1 += "        \"linkType\" : \""+btn_cd+"\",";
				button_1 += "        \"linkTypeName\" : \""+btn_type+"\",";
				button_1 += "        \"linkMo\" : \""+btn_url1+"\",";
				button_1 += "        \"linkPc\" : \""+btn_url2+"\"";
				button_1 += "    }]";
				button_1 += "}";
				
				params.add(new BasicNameValuePair("button_1", button_1));
			}
			
			try {
				int connectTimeout = 2000;
				URI uri = new URI(url);
		        uri = new URIBuilder(uri).build();
				HttpClient httpClient = HttpClientBuilder.create().build();
				HttpPost post = new HttpPost();
				post.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
				post.setConfig(RequestConfig.custom().setConnectTimeout(connectTimeout).setConnectionRequestTimeout(connectTimeout).setSocketTimeout(connectTimeout).build());
				post.setURI(uri);
				HttpResponse response = httpClient.execute(post); 
				org.apache.http.HttpEntity entity = response.getEntity();
				String r = EntityUtils.toString(entity);
	    		r = r.trim();
				rtn = (JSONObject) new JSONParser().parse(r);

				String msg_id = "";
	    		String resultCode = "0000";
	    		long code = (Long)rtn.get("code");
	    		if(code == 0) {
	    			Map<String, Object> info = (Map<String, Object>)rtn.get("info");
	    			msg_id = Long.toString((Long)info.get("mid"));
	    		}else
	    			resultCode = Long.toString(code);
	    			
	    		
	    		rtn.put("resultCode", resultCode);
	    		
	    		param.put("result_code", resultCode);
	            param.put("result_msg", rtn.get("message"));
	            param.put("msg_id", msg_id);
	            param.put("send_type", "K");
	            smsDao.insert(param);
	            
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return rtn;
	}
	
	public Map<String, Object> get_aligo_kakao_token() throws Exception{
		
		Map<String, Object> rtn = new HashMap<String, Object>();
		
		String url = "https://kakaoapi.aligo.in/akv10/token/create/30/s/";
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("apikey", aligo_key));
		params.add(new BasicNameValuePair("userid", aligo_user_id));
		
		try {
			int connectTimeout = 1000;
			URI uri = new URI(url);
	        uri = new URIBuilder(uri).build();
			HttpClient httpClient = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost();
			post.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			post.setConfig(RequestConfig.custom().setConnectTimeout(connectTimeout).setConnectionRequestTimeout(connectTimeout).setSocketTimeout(connectTimeout).build());
			post.setURI(uri);
			HttpResponse response = httpClient.execute(post); 
			org.apache.http.HttpEntity entity1 = response.getEntity();
			String r = EntityUtils.toString(entity1);
    		r = r.trim();
			rtn = (JSONObject) new JSONParser().parse(r);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return rtn;
	}
	
	
}
