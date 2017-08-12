package com.yc.web.model;

import java.io.Serializable;
import java.util.List;

public class JsonModel<T> implements Serializable {
	private static final long serialVersionUID = -1947607909350498604L;
	private int code;
	private String msg;
	private Object obj;
	

	private Integer total; // *�ܼ�¼��
	private Integer pages; // * ��ǰΪ�ڼ�ҳ
	private Integer pagesize; // *ÿҳxx��
	private List<T> rows; // ��¼����

	public JsonModel(int code, String msg, Object obj) {
		super();
		this.code = code;
		this.msg = msg;
		this.obj = obj;
	}

	public JsonModel() {
		super();
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}


	public Integer getTotal() {
		return total;
	}

	// �����ܼ�¼�� Ҫ�ȵ��� setPageSize(),setPages();
	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getPages() {
		return pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
}
