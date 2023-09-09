package com.lqt.controllers;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@Controller
public class CommonController {

    @GetMapping("/app/propertyListings/download/{dir}/{filename}")
    public void dowloadFile(@PathVariable("dir") String dir, @PathVariable("filename") String filename, HttpServletResponse response) throws IOException {
        String filePath = "files\\"+dir+"\\";
        File file = new File(filePath+filename);
        FileInputStream fis = new FileInputStream(file);

        // Set the response headers
        response.setContentType("application/octet-stream");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

        // Write the file content to the response
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = fis.read(buffer)) != -1) {
            response.getOutputStream().write(buffer, 0, bytesRead);
        }
        fis.close();
    }
}
