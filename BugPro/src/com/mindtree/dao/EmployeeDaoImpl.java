package com.mindtree.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mindtree.entity.Employee;

public class EmployeeDaoImpl implements EmployeeDao {
@Autowired
private HibernateTemplate hibernateTemplate;
	@Override
	public List<Integer> getAllNonCISEmplyee() {
		// TODO Auto-generated method stub
		return hibernateTemplate.find("select e.empId from Employee e where e.groupName!='CIS'");
	}

	@Override
	public List<Integer> getAllCISEmplyee() {
		// TODO Auto-generated method stub
		return  hibernateTemplate.find("select e.empId from Employee e where e.groupName='CIS'") ;
	}

	@Override
	public String getName(int id) {
		String hql="select e.name from Employee e where e.empId=id";
		return (String) hibernateTemplate.find(hql).get(0);
	}

}
