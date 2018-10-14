package com.lazz.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	/*
     * This method will list all existing employees.
     */
    @RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
    public String listEmployees(ModelMap model) {
        return "admin-panel";
    }
}
