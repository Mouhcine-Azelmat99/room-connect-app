package com.lqt.controllers;


import com.lqt.pojo.PropertyListing;
import com.lqt.service.LandlordService;
import com.lqt.service.PropertyListingService;
import com.lqt.service.serviceImpl.LocationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/app/tenant")
public class TenantController {

    @Autowired
    private PropertyListingService propertyListingService;



    @GetMapping("/list")
    public String listPropertyListings(Model model) {
        List<PropertyListing> propertyListings = propertyListingService.getAllListings();
        model.addAttribute("propertyListings", propertyListings);
        return "landlord/listings";
    }
    @RequestMapping("/dashboard")
    public String dashboard(Model model){
        return "tenant/dashboard";
    }

    @RequestMapping("/profile")
    public String profile(Model model){
        return "tenant/profile";
    }

    @RequestMapping("/propertyListings")
    public String propertyListings(Model model){
        return "tenant/propertyListings";
    }

    @RequestMapping("/propertyListings/view")
    public String propertyListingsView(Model model){
        return "tenant/propertyListingsView";
    }

    @RequestMapping("/propertyListings/view/apply")
    public String propertyListingsViewApply(Model model){
        return "tenant/propertyListingsViewApply";
    }

    @RequestMapping("/propertyListings/view/apply/success")
    public String propertyListingsViewApplySuccess(Model model){
        return "tenant/propertyListingsViewApplySuccess";
    }

    @RequestMapping("/propertyListings/view/apply/failure")
    public String propertyListingsViewApplyFailure(Model model){
        return "tenant/propertyListingsViewApplyFailure";
    }

    @RequestMapping("/propertyListings/view/apply/success/payment")
    public String propertyListingsViewApplySuccessPayment(Model model){
        return "tenant/propertyListingsViewApplySuccessPayment";
    }

    @RequestMapping("/propertyListings/view/apply/success/payment/success")
    public String propertyListingsViewApplySuccessPaymentSuccess(Model model){
        return "tenant/propertyListingsViewApplySuccessPaymentSuccess";
    }

    @RequestMapping("/propertyListings/view/apply/success/payment/failure")
    public String propertyListingsViewApplySuccessPaymentFailure(Model model){
        return "tenant/propertyListingsViewApplySuccessPaymentFailure";
    }

    @RequestMapping("/propertyListings/view/apply/success/payment/success/contract")
    public String propertyListingsViewApplySuccessPaymentSuccessContract(Model model){
        return "tenant/propertyListingsViewApplySuccessPaymentSuccessContract";
    }

    @RequestMapping("/propertyListings/view/apply/success/payment/success/contract/success")
    public String propertyListingsViewApplySuccessPaymentSuccessContractSuccess(Model model){
        return "tenant/propertyListingsViewApplySuccessPaymentSuccessContractSuccess";
    }



}
