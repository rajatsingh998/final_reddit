package com.example.demo.Controller;

//package com.example.form.controller;

import com.example.demo.Model.Post;
import com.example.demo.Service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

//import com.example.form.message.Response;
//import com.example.form.model.Customer;
//import com.example.form.service.CustomerService;

//import com.javasampleapproach.jqueryajax.message.Response;
//import com.javasampleapproach.jqueryajax.model.Customer;

@RestController
@RequestMapping("/")
public class NewController {

    @Autowired
    VoteService voteService;


    @PostMapping(value = "/save")
    public Response postCustomer(@RequestParam int id) {
        System.out.println("like save");
        int userId=voteService.findUser();
        voteService.saveMyVote(1,userId,id);
        return new Response("Done", "you liked ... ");
    }

    @GetMapping("/upVote")
    public Response upVote(@RequestParam String id){
        System.out.println("ashish "+id);
        int userId=voteService.findUser();
        Post post=voteService.saveMyVote(1,userId,Integer.parseInt(id));
        return new Response("DONE",post.getTotlevote());
    }

    @GetMapping("/downVote")
    public Response downVote(@RequestParam int id){
        int userId=voteService.findUser();
        Post post=voteService.saveMyVote(-1,userId,id);
        return new Response("DONE",post.getTotlevote());
    }


}