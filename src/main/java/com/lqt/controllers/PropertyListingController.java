package com.lqt.controllers;


import com.lqt.pojo.Landlord;
import com.lqt.pojo.Location;
import com.lqt.pojo.PropertyListing;
import com.lqt.service.LandlordService;
import com.lqt.service.PropertyListingService;
import com.lqt.service.serviceImpl.LocationServiceImpl;
import com.lqt.utils.FileUploadUtil;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/app/landlord/propertyListings")
public class PropertyListingController {
    @Autowired
    private PropertyListingService propertyListingService;
    @Autowired
    private LocationServiceImpl locationService;
    @Autowired
    private LandlordService landlordService;

    @GetMapping("/list")
    public String listPropertyListings(Model model) {
        List<PropertyListing> propertyListings = propertyListingService.getAllListings();
        model.addAttribute("propertyListings", propertyListings);
//        System.out.println(propertyListings);
        return "landlord/listings";
    }

    @GetMapping("/add")
    public String showAddPropertyListingForm(Model model) {
        model.addAttribute("listing", new PropertyListing());
        return "landlord/add-listing";
    }

    @PostMapping("/add")
    public String addPropertyListing(
            HttpServletRequest request,
            @RequestParam("image1") MultipartFile image1,
            @RequestParam("image2") MultipartFile image2,
            @RequestParam("image3") MultipartFile image3,
            Authentication authentication
    ) {
        PropertyListing propertyListing=new PropertyListing();
        propertyListing.setPropertyType(request.getParameter("propertyType"));
        propertyListing.setTitle(request.getParameter("title"));
        propertyListing.setDescription(request.getParameter("description"));
        propertyListing.setPrice(Double.valueOf(request.getParameter("price")));
        propertyListing.setFurnished(Boolean.valueOf(request.getParameter("furnished")));
        propertyListing.setFurnished(Boolean.valueOf(request.getParameter("petFriendly")));
        propertyListing.setTotalSquareFootage(Double.valueOf(request.getParameter("totalSquareFootage")));
        propertyListing.setTotalSquareFootage(Double.valueOf(request.getParameter("totalSquareFootage")));
        propertyListing.setNumberOfBathrooms(Integer.valueOf(request.getParameter("numberOfBathrooms")));
        propertyListing.setNumberOfBedrooms(Integer.valueOf(request.getParameter("numberOfBedrooms")));
        propertyListing.setNumberOfResidents(Integer.valueOf(request.getParameter("numberOfResidents")));

        Location location =new Location();
        location.setAddress(request.getParameter("location.address"));
        location.setCity(request.getParameter("location.city"));
        location.setCountry(request.getParameter("location.country"));
        location.setStateProvince(request.getParameter("location.stateProvince"));
        location.setZipPostalCode(request.getParameter("location.zipPostalCode"));
        locationService.save(location);
        propertyListing.setLocation(location);
        List<MultipartFile> images= new ArrayList<>();
        images.add(image1);
        images.add(image2);
        images.add(image3);
        List<String> imgNames=new ArrayList<>();
        images.stream().forEach(img -> {
            String fileName = StringUtils.cleanPath(img.getOriginalFilename());
            String extension = fileName.substring(fileName.lastIndexOf("."));
            String newfileName = FileUploadUtil.getRandomId()+fileName+extension;
            imgNames.add(newfileName);
        });
        propertyListing.setImageUrls(imgNames);
        String uploadDirListing = "files/listing";

        for(int i=0;i<3;i++){
            try {
                FileUploadUtil.saveFile(uploadDirListing,imgNames.get(i),images.get(i));
            }catch (IOException exception){
                exception.printStackTrace();
                return "redirect:/app/landlord/add-listing?success=false";
            }
        }
        System.out.println("landlord username:  "+authentication.getName());
        Landlord landlord= landlordService.getByUsername(authentication.getName());
        propertyListing.setLandlord(landlord);
        propertyListingService.addPropertyListing(propertyListing);
        return "redirect:/app/landlord/propertyListings/list?success=true";
    }

    @GetMapping("/edit/{id}")
    public String showEditPropertyListingForm(@PathVariable Long id, Model model) {
        PropertyListing propertyListing = propertyListingService.getPropertyListingById(id);
        model.addAttribute("listing", propertyListing);
        return "landlord/edit-listing";
    }

    @PostMapping("/edit")
    public String editPropertyListing(@ModelAttribute PropertyListing propertyListing) {
        propertyListingService.editPropertyListing(propertyListing);
        return "redirect:/app/landlord/propertyListings/list";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("listingId") Long listingId){
        propertyListingService.delete(listingId);
        return "redirect:/app/landlord/propertyListings/list";
    }

}
