package com.example.demo.Controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@Controller
public class PostError implements ErrorController {

    @RequestMapping("/error")
    public ModelAndView handleError(HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();

        if(response.getStatus() == HttpStatus.NOT_FOUND.value()) {
            modelAndView.setViewName("404");
        }
        else if(response.getStatus() == HttpStatus.FORBIDDEN.value()) {
            modelAndView.setViewName("error-code");
        }
        else if(response.getStatus() == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            modelAndView.setViewName("5xx");
        }
        else {
            modelAndView.setViewName("error-code");
        }

        return modelAndView;
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
