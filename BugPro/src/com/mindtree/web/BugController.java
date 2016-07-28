package com.mindtree.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mindtree.dao.BugDao;
import com.mindtree.dao.EmployeeDao;

import com.mindtree.entity.Bugs;

@Controller
public class BugController {
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private BugDao bugDao;

	@RequestMapping(value = "/resolveBug.view")
	public String getResolveForm(HttpServletRequest req, Model model) {
		int id = Integer.parseInt(req.getParameter("id"));
		Bugs b = bugDao.get(id);
		model.addAttribute("resolvedBug", b);
		return "resolveForm";
	}

	@RequestMapping(value = "/updateBug.view")
	public String updateBug(@ModelAttribute("resolvedBug") Bugs b, Model model) {
		Bugs b1 = bugDao.get(b.getBugId());
		bugDao.resolverdBy(b1, b.getResolvedBy());
		model.addAttribute("rbugs", bugDao.getresolvedBugs());
		return "resolvedBugs";

	}

	@RequestMapping(value = "/reportBug.view")
	public String reportBugForm(Model model) {
		Bugs bug = new Bugs();
		bug.setBugDesc("enter desc");
		bug.setReportedDate(new Date());
		model.addAttribute("report", bug);
		return "reportForm";
	}

	@ModelAttribute("NonCIS")
	public List<Integer> getNonCIS() {
		return employeeDao.getAllNonCISEmplyee();
	}

	@ModelAttribute("CIS")
	public List<Integer> getCIS() {
		return employeeDao.getAllCISEmplyee();
	}

	@RequestMapping(value = "/addReport.view")
	public String addBugReport(@ModelAttribute("report") Bugs bug) {
		bugDao.registeredBug(bug);
		return "redirect:unresolved.view";

	}

	@RequestMapping(value = "/unresolved.view")
	public String getUnsesolvedBug(Model model) {
		System.out.println(bugDao.unresolvedBugs());
		model.addAttribute("unresolveBug", bugDao.unresolvedBugs());
		return "display";

	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		CustomDateEditor dateEditor = new CustomDateEditor(
				new SimpleDateFormat("dd-MM-yyyy"), true);
		binder.registerCustomEditor(Date.class, dateEditor);

	}
}
