package com.mindtree.dao;

import java.util.List;

import com.mindtree.entity.Employee;

public interface EmployeeDao {
public List<Integer> getAllNonCISEmplyee();
public List<Integer> getAllCISEmplyee();	
public String getName(int id);

}
