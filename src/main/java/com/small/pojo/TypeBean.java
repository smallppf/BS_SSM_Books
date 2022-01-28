package com.small.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TypeBean {
	/**
	 * 图书分类的数据表的bean
	 */
	private int tid;//分类的id
	private String name;//分类的名称

	
}
