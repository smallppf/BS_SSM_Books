package com.small.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HistoryBean {
	/**
	 * 历史借阅记录的数据表的bean
	 */
	private int hid;//借阅记录的id
	private int aid;//读者的id
	private int bid;//图书的id
	private String card;//图书号
	private String bookname;//图书名称
	private String adminname;//读者的账号
	private String username;//读者的姓名
	private String begintime;//借阅时间
	private String endtime;//要还书的时间
	private int status;//表示借阅状态，1为正在借阅，0是已经还书

}
