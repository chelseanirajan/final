package com.jugal.adminsecurity.user.controller;

import com.jugal.adminsecurity.user.service.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownloadController {
    @Autowired
    private StudentServiceImpl studentService;

    /*
     * Download Files
     */

    @GetMapping("/file")
    public ResponseEntity<InputStreamResource> downloadFile() {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=students.xlsx");

        return ResponseEntity
                .ok()
                .headers(headers)
                .body(new InputStreamResource(studentService.loadExcel()));
    }
    @PostMapping("/file/download")
    public ResponseEntity<InputStreamResource> downloadExcel(@RequestParam("searchName") Long searchName) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=students.xlsx");

        return ResponseEntity
                .ok()
                .headers(headers)
                .body(new InputStreamResource(studentService.loadFile(searchName)));
    }

}
