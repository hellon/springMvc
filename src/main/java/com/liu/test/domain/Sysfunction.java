package com.liu.test.domain;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

/**
 * Sysfunction entity. @author MyEclipse Persistence Tools
 */


public class Sysfunction implements java.io.Serializable {

	// Fields

	private Integer id;
	private String functionId;
	private String functionDesc;
	private Integer functionSort;
	private String functionName;
	private Timestamp addTime;
	private String functionModel;
	private Integer used;

	// Constructors

	/** default constructor */
	public Sysfunction() {
	}

	/** full constructor */
	public Sysfunction(String functionId, String functionDesc,
			Integer functionSort, String functionName, Timestamp addTime,
			String functionModel, Integer used) {
		this.functionId = functionId;
		this.functionDesc = functionDesc;
		this.functionSort = functionSort;
		this.functionName = functionName;
		this.addTime = addTime;
		this.functionModel = functionModel;
		this.used = used;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFunctionId() {
		return this.functionId;
	}

	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}

	public String getFunctionDesc() {
		return this.functionDesc;
	}

	public void setFunctionDesc(String functionDesc) {
		this.functionDesc = functionDesc;
	}

	public Integer getFunctionSort() {
		return this.functionSort;
	}

	public void setFunctionSort(Integer functionSort) {
		this.functionSort = functionSort;
	}

	public String getFunctionName() {
		return this.functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public String getFunctionModel() {
		return this.functionModel;
	}

	public void setFunctionModel(String functionModel) {
		this.functionModel = functionModel;
	}

	public Integer getUsed() {
		return this.used;
	}

	public void setUsed(Integer used) {
		this.used = used;
	}

}