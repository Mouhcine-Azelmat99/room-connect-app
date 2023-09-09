package com.lqt.controllers;

import com.lqt.pojo.Utilisateur;
import com.lqt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("app/auth")
public class AuthController {

    private final UserService userService;

    @Autowired
    private AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("login")
    public String login(){
        return "login";
    }

    @GetMapping("register")
    public String register( Model model){
        model.addAttribute("user", new Utilisateur());
        return "register";
    }
    @PostMapping("register")
    public String register(@ModelAttribute("user") Utilisateur user){
        System.out.println(user);
        userService.save(user);
        return "redirect:/app/auth/login";
    }


}
