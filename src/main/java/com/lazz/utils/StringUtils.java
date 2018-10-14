package com.lazz.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lazz.service.domain.Users;

public class StringUtils {
	public static boolean isEmpty(String val) {
		return val == null || val.equals("") ? true : false;
	}
	
	public static String generateUserId(String userType, int maxValue) {
		StringBuilder userId = new StringBuilder();
		maxValue += 1;
		if( "HQ".equalsIgnoreCase(userType)) {
			userId.append("HQ").append(maxValue);
		} else if ( "STOKIEST".equalsIgnoreCase(userType) ) {
			userId.append("SKT").append(maxValue);
		}else if ( "AGENT".equalsIgnoreCase(userType) ) {
			userId.append("AGT").append(maxValue);
		}else if ( "USER".equalsIgnoreCase(userType) ) {
			userId.append("USR").append(maxValue);
		}
		return userId.toString();
	}
	
	public static Map<String, String> convertListToMap(List<ValueO> valueList){
		Map<String,String>  values= new HashMap<String,String>();
		if( valueList != null && valueList.size() > 0){
			for( ValueO valueO :  valueList) {
				values.put(valueO.getKey(), valueO.getValue());
			}
		}
		return values;
	}
	
	public static String prependFileNameWithTimeStamp(String fileName) {
		return new StringBuilder(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()))
				.append(fileName).toString();
	}
	
	public static String prepareAddress(Users user) {
		String finalAddress = null;
		StringBuilder address = new StringBuilder();
		address.append(user.getUsrdShpAddr1());
		if( !isEmpty(user.getUsrdShpAddr2()) ) {
			address.append(",");
			address.append(user.getUsrdShpAddr2());
		}
		address.append(user.getUsrdState());
		address.append(" ").append(user.getUsrdPostCode());
		finalAddress = address.toString();
		return finalAddress;
	}
}
