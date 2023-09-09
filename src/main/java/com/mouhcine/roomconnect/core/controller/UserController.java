package com.mouhcine.roomconnect.core.controller;

import com.mouhcine.roomconnect.core.bo.Utilisateur;
import com.mouhcine.roomconnect.core.service.CustomAuthentificationService;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("app/admin")
public class UserController {
    @Autowired
    private CustomAuthentificationService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @GetMapping("register")
    public String login(Model model){
        model.addAttribute("user",new Utilisateur());
        return "register";
    }

    @GetMapping("users")
    public String getAll(Model model){
        model.addAttribute("data",userService.getAll());
        return "users";
    }

    @PostMapping("addUser")
    public String addUser(@ModelAttribute("user") Utilisateur user, RedirectAttributes redirectAttributes){
        String password =generatePassayPassword();
        user.setPassword(password);
        userService.addUser(user);
        redirectAttributes.addFlashAttribute("message", "User Ajouter avec le mot de pass : "+password);
        return "redirect:/app/admin/users";
    }
    @PostMapping("resetPassword")
    public String resetPassword(@RequestParam("user_id") Long user_id,RedirectAttributes redirectAttributes){
        Utilisateur user = userService.getById(user_id);
        String password =generatePassayPassword();
        user.setPassword(password);
        userService.update(user);
        redirectAttributes.addFlashAttribute("message", "Le nouveau mot de pass : "+password);
        return "redirect:/app/admin/users";
    }

    @PostMapping("deleteUser")
    public String deleteUser(@RequestParam("user_id") Long user_id,RedirectAttributes redirectAttributes){
        userService.delete(user_id);
        redirectAttributes.addFlashAttribute("message", "Compte est supprimer");
        return "redirect:/app/admin/users";
    }

    private String generatePassayPassword() {
        CharacterRule digits = new CharacterRule(EnglishCharacterData.Digit);

        PasswordGenerator passwordGenerator = new PasswordGenerator();
        String password = passwordGenerator.generatePassword(10, digits);

        return password;
    }
}
