package com.small.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminBean {
	/**
	 * 用户的数据表的bean 
	 */
	private int aid;//id
	private int status;//用来判断是管理员还是用户，用户的值为1，管理员为2
	private String username;//账号，
	private String name;//读者的姓名
	private String password;//密码
	private String email;//邮箱
	private String phone;//手机号
	private int lend_num;//可借阅天数
	private int max_num;//最大可借数

	
}
