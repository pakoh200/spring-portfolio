package com.springportfolio.domain.boards;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Board {
	private int num;

	@NotEmpty
	@Size(min = 2, max = 30)
	private String title;

	@NotEmpty
	@Size(min = 2, max = 12)
	private String name;

	@NotEmpty
	@Size(min = 2, max = 300)
	private String contents;

	private Date createDate;

	private int count;

	private int start;

	private int end;

	private String skey;

	private String sval;

	public Board() {
	}

	public Board(int num, String title, String name, String contents, Date createDate, int count) {
		this.num = num;
		this.title = title;
		this.name = name;
		this.contents = contents;
		this.createDate = createDate;
		this.count = count;
	}

	public Board(String title, String name, String contents) {
		this.title = title;
		this.name = name;
		this.contents = contents;
	}

	public Board(int num, String title, String name, String contents) {
		this.num = num;
		this.title = title;
		this.name = name;
		this.contents = contents;
	}

	public Board(int num, int count) {
		this.num = num;
		this.count = count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getSkey() {
		return skey;
	}

	public void setSkey(String skey) {
		this.skey = skey;
	}

	public String getSval() {
		return sval;
	}

	public void setSval(String sval) {
		this.sval = sval;
	}

	public boolean matchUserName(String name) {
		if (name == null) {
			return false;
		}
		return this.name.equals(name);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + num;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Board other = (Board) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (num != other.num)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", title=" + title + ", name=" + name + ", contents=" + contents + ", createDate=" + createDate + ", count="
				+ count + "]";
	}

}
