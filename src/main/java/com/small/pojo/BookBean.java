package com.small.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookBean {
	/**
	 * 图书的数据表的bean
	 */
	private int bid;//id
	private String name;//图书名称
	private String card;//图书号
	private String autho;//作者
	private int num;//图书数量
	private String type;//图书的分类
	private String press;//出版社
	private String address;//图片地址

}
