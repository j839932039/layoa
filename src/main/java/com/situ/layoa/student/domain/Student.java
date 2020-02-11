package com.situ.layoa.student.domain;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Alias("Student")
public class Student implements Serializable{

	private static final long serialVersionUID = 1L;
	private Long rowId;//主键
	private String stuName;//学生姓名
	private Integer stuAge;//学生年龄
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stuBrith;//学生生日
	private String stuPicture;//学生头像
	private CommonsMultipartFile stuFlie;
	
	public Long getRowId() {
		return rowId;
	}
	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public Integer getStuAge() {
		return stuAge;
	}
	public void setStuAge(Integer stuAge) {
		this.stuAge = stuAge;
	}
	public Date getStuBrith() {
		return stuBrith;
	}
	public void setStuBrith(Date stuBrith) {
		this.stuBrith = stuBrith;
	}
	public String getStuPicture() {
		return stuPicture;
	}
	public void setStuPicture(String stuPicture) {
		this.stuPicture = stuPicture;
	}
	public CommonsMultipartFile getStuFlie() {
		return stuFlie;
	}
	public void setSstuFlie(CommonsMultipartFile stuFlie) {
		this.stuFlie = stuFlie;
	}
	@Override
	public String toString() {
		return "Student [rowId=" + rowId + ", stuname=" + stuName + ", stuAge=" + stuAge + ", stuBrith=" + stuBrith
				+ ", stuPicture=" + stuPicture + ", sstuFlie=" + stuFlie + "]";
	}
	
	
}
