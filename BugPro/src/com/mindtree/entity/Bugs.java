package com.mindtree.entity;

import java.util.Date;

public class Bugs {
private int bugId;
private String bugDesc;
private Date reportedDate;
private Employee reportedBy;
private Employee resolvedBy;
private Date resolvedDate;

@Override
public String toString() {
	return "Bugs [bugId=" + bugId + ", bugDesc=" + bugDesc + ", reportedDate="
			+ reportedDate + ", resolvedDate=" + resolvedDate + "]";
}
public int getBugId() {
	return bugId;
}
public void setBugId(int bugId) {
	this.bugId = bugId;
}
public String getBugDesc() {
	return bugDesc;
}
public void setBugDesc(String bugDesc) {
	this.bugDesc = bugDesc;
}
public Date getReportedDate() {
	return reportedDate;
}
public void setReportedDate(Date reportedDate) {
	this.reportedDate = reportedDate;
}
public Employee getReportedBy() {
	return reportedBy;
}
public void setReportedBy(Employee reportedBy) {
	this.reportedBy = reportedBy;
}
public Employee getResolvedBy() {
	return resolvedBy;
}
public void setResolvedBy(Employee resolvedBy) {
	this.resolvedBy = resolvedBy;
}
public Date getResolvedDate() {
	return resolvedDate;
}
public void setResolvedDate(Date resolvedDate) {
	this.resolvedDate = resolvedDate;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((bugDesc == null) ? 0 : bugDesc.hashCode());
	result = prime * result + bugId;
	result = prime * result
			+ ((reportedDate == null) ? 0 : reportedDate.hashCode());
	result = prime * result
			+ ((resolvedDate == null) ? 0 : resolvedDate.hashCode());
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
	Bugs other = (Bugs) obj;
	if (bugDesc == null) {
		if (other.bugDesc != null)
			return false;
	} else if (!bugDesc.equals(other.bugDesc))
		return false;
	if (bugId != other.bugId)
		return false;
	if (reportedDate == null) {
		if (other.reportedDate != null)
			return false;
	} else if (!reportedDate.equals(other.reportedDate))
		return false;
	if (resolvedDate == null) {
		if (other.resolvedDate != null)
			return false;
	} else if (!resolvedDate.equals(other.resolvedDate))
		return false;
	return true;
}
}
