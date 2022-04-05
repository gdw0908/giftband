package com.mc.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AuthConsts {
	
	public static List<Map<String, Object>> auth_list = new ArrayList<Map<String, Object>>(){
		private static final long serialVersionUID = 1L;
		{
			add(new HashMap<String, Object>(){
				private static final long serialVersionUID = 1L;
				{
					put("id", "joonyland");
					put("Authorization", "pk_7dfa-8ad9b7-ab3-2503a");
				}
			});
			
			add(new HashMap<String, Object>(){
				private static final long serialVersionUID = 1L;
				{
					put("id", "vippay");
					put("Authorization", ""); //추후추가
				}
			});		
			
		}
	};
}
