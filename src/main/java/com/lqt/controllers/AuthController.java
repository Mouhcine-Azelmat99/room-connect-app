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
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

import static com.lqt.util.imagesLoader.loadAvatars;

@Controller
@RequestMapping("app/auth")
public class AuthController {
    private final PasswordEncoder passwordEncoder;
    private final UserService userService;

    @Autowired
    private AuthController(PasswordEncoder passwordEncoder, UserService userService) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    @GetMapping("login")
    public String login() {
        return "login";
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("user", new Utilisateur());
        List<String> avatars = new ArrayList<>();
        try {
            avatars = loadAvatars();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        model.addAttribute("avatars", avatars);
        System.out.println("login");
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user")  Utilisateur user,
                               BindingResult bindingResult,
                               Model model) {
        if (bindingResult.hasErrors()) {
            List<String> avatars = new ArrayList<>();
            try {
                avatars = loadAvatars();

            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
            }
            model.addAttribute("avatars", avatars);
            return "register";
        }
        if (userService.findByUsername(user.getUsername())) {
            model.addAttribute("usernameExistsError", "Username already exists!");
            return "register";
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        System.out.println("user: " + user.getPassword());
        userService.saveUser(user);
        return "redirect:/login";
    }
    // create the show profil
    @GetMapping("/profil")
    public String showProfil(Model model ){
        // get the actual user
        String userName = SecurityUtil.getSessionUser();
        // get the actual user from the database
        Utilisateur user = userService.getByUserName(userName );
        model.addAttribute("user", user);

        return "profil";
    }

}
