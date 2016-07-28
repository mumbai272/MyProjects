package com.mindtree.dao;

import java.util.List;

import com.mindtree.entity.Bugs;
import com.mindtree.entity.Employee;

public interface BugDao {
	public void registeredBug(Bugs b);

	public void resolverdBy(Bugs b, Employee e);

	public List<Object[]> unresolvedBugs();

	public List<Bugs> getresolvedBugs();

	public Bugs get(int id);
}
