package com.mindtree.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mindtree.entity.Bugs;
import com.mindtree.entity.Employee;

public class BugDaoImpl implements BugDao {
@Autowired
private HibernateTemplate hibernateTemplate;

@Override
public void registeredBug(Bugs b) {
	hibernateTemplate.save(b);
	
}

@Override
public void resolverdBy(Bugs b, Employee e) {
b.setResolvedBy(e);
b.setResolvedDate(new Date());
hibernateTemplate.update(b);
	
}

@Override
public List<Object[]> unresolvedBugs() {
	String hql=" from Bugs b  join b.reportedBy e where b.resolvedBy=null";
	return hibernateTemplate.find(hql);
}
@Override
public List<Bugs> getresolvedBugs() {
	String hql=" from Bugs b  where b.resolvedBy!=null";
	return hibernateTemplate.find(hql);
}

@Override
public Bugs get(int id) {
	String hql="from Bugs b where b.bugId=:id" ;
	return (Bugs) hibernateTemplate.findByNamedParam(hql, "id", id).get(0);
}
}
