package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.impl.CategoryDAO;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("categories", categoryDAO.findAll());
		return "category/index";
	}
}
