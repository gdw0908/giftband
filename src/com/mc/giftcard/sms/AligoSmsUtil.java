package com.mc.giftcard.sms;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONObject;
import com.mc.common.util.StringUtil;

public class AligoSmsUtil {
	
	private static String smsTestMode = "N";	//Y:테스트, N:리얼 
	
	public static JSONObject send(String aligo_user_id, String aligo_key, String msg, String title, String receiver, String sender, String image) {
		
		JSONObject resultJson = new JSONObject();
		boolean isError = false;
		
		try{
			
			final String encodingType = "utf-8";
			final String boundary = "____boundary____";
		
			/**************** 문자전송하기 예제 ******************/
			/* "result_code":결과코드,"message":결과문구, */
			/* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
			/* 동일내용 > 전송용 입니다.  
			/******************** 인증정보 ********************/
			String sms_url = "https://apis.aligo.in/send/"; // 전송요청 URL
			
			Map<String, String> sms = new HashMap<String, String>();
			
			sms.put("user_id", aligo_user_id); // SMS 아이디
			sms.put("key", aligo_key); //인증키
			
			/******************** 인증정보 ********************/
			
			/******************** 전송정보 ********************/
			sms.put("msg", msg); 					// 메세지 내용
			sms.put("receiver", receiver); 			// 수신번호
			sms.put("destination", ""); 			// 수신인 %고객명% 치환
			sms.put("sender", sender); 				// 발신번호
			sms.put("rdate", ""); 					// 예약일자 - 20161004 : 2016-10-04일기준
			sms.put("rtime", ""); 					// 예약시간 - 1930 : 오후 7시30분
			sms.put("testmode_yn", smsTestMode); 	// Y 인경우 실제문자 전송X , 자동취소(환불) 처리
			sms.put("title", title); 				//  LMS, MMS 제목 (미입력시 본문중 44Byte 또는 엔터 구분자 첫라인)
			
			//String image = "";
			//image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치
			
			/******************** 전송정보 ********************/
			
			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
			
			builder.setBoundary(boundary);
			builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
			builder.setCharset(Charset.forName(encodingType));
			
			for(Iterator<String> i = sms.keySet().iterator(); i.hasNext();){
				String key = i.next();
				builder.addTextBody(key, sms.get(key)
						, ContentType.create("Multipart/related", encodingType));
			}
			
			File imageFile = new File(image);
			if(image!=null && image.length()>0 && imageFile.exists()){
		
				builder.addPart("image",
						new FileBody(imageFile, ContentType.create("application/octet-stream"),
								URLEncoder.encode(imageFile.getName(), encodingType)));
			}
			
			HttpEntity entity = builder.build();
			
			HttpClient client = HttpClients.createDefault();
			HttpPost post = new HttpPost(sms_url);
			post.setEntity(entity);
			
			//HttpResponse res = client.execute(post); TODO : 주석제거 
			String result = "{\"result_code\":-101,\"message\":\"\\\\uc778\\\\uc99d\\\\uc624\\\\ub958\\\\uc785\\\\ub2c8\\\\ub2e4.-IP\"}";
			/*String result = ""; //{"result_code":-101,"message":"\\uc778\\uc99d\\uc624\\ub958\\uc785\\ub2c8\\ub2e4.-IP"} TODO : 주석제거 
			if(res != null){
				BufferedReader in = new BufferedReader(new InputStreamReader(res.getEntity().getContent(), encodingType));
				String buffer = null;
				while((buffer = in.readLine())!=null){
					result += buffer;
				}
				in.close();
			} TODO : 주석제거  */ 
			
			resultJson = StringUtil.convertStringToJson(result);
			if("1".equals(resultJson.get("result_code"))) {
				resultJson.put("resultCode", "0000");
				resultJson.put("resultMsg", "정상");
			}else {
				isError = true;
			}						
			//{"result_code":"1","message":"success","msg_id":"126871702","success_cnt":1,"error_cnt":0,"msg_type":"SMS"}
		}catch(Exception e){
			isError = true;
			e.printStackTrace();
		}finally {
			if(isError == true){
				resultJson.put("resultCode", "9999");
				resultJson.put("resultMsg", "API 호출 오류");
				return resultJson;
			}
		}
		
		return resultJson;
	}
}
