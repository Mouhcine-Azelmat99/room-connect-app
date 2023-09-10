package com.lqt.controllers;

import com.lqt.pojo.Utilisateur;
import com.lqt.security.SecurityUtil;
import com.lqt.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.*;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import static com.lqt.util.imagesLoader.loadAvatars;

@Controller
public class AuthController {
    private final PasswordEncoder passwordEncoder;
    private final UserService userService;

    @Autowired
    private AuthController(PasswordEncoder passwordEncoder, UserService userService) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    @GetMapping("login")
    public String loginError() {
        return "auth/login";
    }
    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("user", new Utilisateur());
        model.addAttribute("avatars", loadAvatars());
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user")  Utilisateur user, BindingResult bindingResult, Model model, ModelAndView modelAndView) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("avatars", loadAvatars());

            return "auth/register";
        }
        if (userService.findByUsername(user.getUsername()) || userService.findByEmail(user.getEmail())) {
            model.addAttribute("usernameExistsError", "Username or email already exists");
            return "auth/register";
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        System.out.println("user: " + user.getPassword());
        userService.saveUser(user);
        return "redirect:/login";
    }
    @GetMapping("/profil")
    public String showProfil(Model model ){
        String userName = SecurityUtil.getSessionUser();
        Utilisateur user = userService.getByUserName(userName );
        model.addAttribute("user", user);
        return "profil";
    }

}
