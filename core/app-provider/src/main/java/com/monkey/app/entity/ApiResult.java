package com.monkey.app.entity;

import lombok.Data;

import java.util.HashMap;

@Data
public class ApiResult {
	    public static final int SUCCESS = 200;
	    public static final int ERROR = 100;
	    
	    /**
	     * 返回代码
	     */
	    private int code;
	    /**
	     * 返回结果
	     */
	    private Object data;
	    
	    private String Message;

		public int getCode() {
			return code;
		}

		public void setCode(int code) {
			this.code = code;
		}

		public Object getData() {
			return data;
		}

		public void setData(Object data) {
			this.data = data;
		}

		public String getMessage() {
			return Message;
		}

		public void setMessage(String message) {
			Message = message;
		}

	    
	    public static ApiResult AuthError(){
			ApiResult ar=new ApiResult();
			ar.setCode(ApiResult.ERROR);
			ar.setData( new HashMap<String,Object>());
			ar.setMessage("token验证失败!");
			return ar;
		}

	    
}
