package com.example.demo.websocket;

import com.example.demo.Model.Comment;
import com.example.demo.Model.Post;
import com.example.demo.Model.User;
import com.example.demo.Repository.CommentRepository;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import twitter4j.TwitterException;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Comment;

@Controller
public class ChatController {
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private PostService postService;

    @Autowired
    private VoteService voteService;

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @Autowired
    VoteByPostIdService voteByPostIdService;

    @Autowired
    UserRepository repo2;
    @MessageMapping("/chat.register")
    @SendTo("/topic/public")
    public ChatMessage register(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }

    @MessageMapping("/chat.send")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) throws TwitterException {
        System.out.println("post id is "+ chatMessage.getId());
        User userTable=userService.findUser(chatMessage.getSender());
        Post post = postService.get(chatMessage.getId());
        com.example.demo.Model.Comment comment= new Comment();
        comment.setContent(chatMessage.getContent());
        if(userTable==null)
        {
            System.out.println("asccccccccc");
            return chatMessage;
        }
        comment.setUser(userTable);
        comment.setPosts(post);
        commentRepository.save(comment);

        return chatMessage;
    }

}
