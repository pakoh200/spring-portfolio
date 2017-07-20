package com.springportfolio.domain.answer;

import java.time.LocalDateTime;
import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Answer {
	@JsonProperty
	private int id;

	@NotEmpty
	@Size(min = 2, max = 30)
	@JsonProperty
	private String writer;

	@NotEmpty
	@JsonProperty
	private String contents;
	
	@JsonProperty
	private int boardId;

	@JsonProperty
	private Date createDate;

	public Answer() {
	}

	public Answer(int id, String writer, String contents, int boardId) {
		this.id = id;
		this.writer = writer;
		this.contents = contents;
		this.boardId = boardId;
	}

	public Answer(int id, String writer, String contents, int boardId, Date createDate) {
		this.id = id;
		this.writer = writer;
		this.contents = contents;
		this.boardId = boardId;
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardId;
		result = prime * result + ((contents == null) ? 0 : contents.hashCode());
		result = prime * result + id;
		result = prime * result + ((writer == null) ? 0 : writer.hashCode());
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
		Answer other = (Answer) obj;
		if (boardId != other.boardId)
			return false;
		if (contents == null) {
			if (other.contents != null)
				return false;
		} else if (!contents.equals(other.contents))
			return false;
		if (id != other.id)
			return false;
		if (writer == null) {
			if (other.writer != null)
				return false;
		} else if (!writer.equals(other.writer))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Answer [id=" + id + ", writer=" + writer + ", contents=" + contents + ", boardId=" + boardId + ", createDate=" + createDate + "]";
	}

}
