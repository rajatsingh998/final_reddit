package com.example.demo.Controller;

import com.example.demo.Model.*;
import com.example.demo.Repository.ImagePostRepository;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Service.*;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import twitter4j.TwitterException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
public class MainController {

    @Autowired
    private PostService postService;
    @Autowired
    private CategoryService categoryService;
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

    @Autowired
    ImagePostRepository repo5;

    @Autowired
    ImagePostService imagePostService;

//    @Autowired
//    private Twitter twitter;

    Logger log= LoggerFactory.getLogger(MainController.class);
    @GetMapping("/try")
    public ModelAndView getMessage()
    {
        Post post=new Post();

//        List<Category> allCategories= categoryService.listAll();
        ModelAndView mv= new ModelAndView("rich_text_editor");
        mv.addObject("post",post);
        return mv;
    }
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping(value = "/newCategory")
    public  ModelAndView categorynew(){
        ModelAndView mv= new ModelAndView();
        Category category= new Category();
        mv.setViewName("new-category");
        mv.addObject("category",category);
        return mv;
    }

    @PostMapping(value = "/newCategory")
    public  ModelAndView categorySave(@ModelAttribute("category")Category category){

        categoryService.save(category);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/")
    public ModelAndView home() {

        log.debug("Enetering in all blogs list");
        Iterable<ImagePost> images= imagePostService.findAll();
        List<Post> list=new ArrayList<>();
        ModelAndView mav = new ModelAndView();
        List<Post> latestPost= postService.latestPost();
        List<Category> categories=categoryService.getAllCategory();
       list=postService.listAll();
            mav.setViewName("list-blog");
            List<Vote> allVote=voteService.listAll();
        List<Category> categoryList=categoryService.findAll();
            mav.addObject("categoryList",categoryList);
            mav.addObject("categories",categories);
            mav.addObject("latestPost",latestPost);
        mav.addObject("images",images);
        mav.addObject("listPost", list);

        mav.addObject("votes",allVote);

        log.debug("Exiting Allblogs list");

        return mav;
    }
    @RequestMapping(value = "/imageDisplay", method = RequestMethod.GET)
    public void showImage(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request)
            throws ServletException, IOException {

        ImagePost item = imagePostService.getFile(id);
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(item.getData());
        response.getOutputStream().close();

    }
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView showProfile(@RequestParam("name") String name)
             {
                 User user=userService.findUser(name);
                 List<Post> posts=postService.findByUser(user);

                 List<Post> latestPost= postService.latestPost();
                 List<Category> categories=categoryService.getAllCategory();
                 List<Vote> allVote=voteService.listAll();
                 List<Category> categoryList=categoryService.findAll();
                 Iterable<ImagePost> images= imagePostService.findAll();

                 ModelAndView mv= new ModelAndView();
                 mv.setViewName("user-post");

                 mv.addObject("categoryList",categoryList);
                 mv.addObject("categories",categories);
                 mv.addObject("latestPost",latestPost);
                 mv.addObject("images",images);
                 mv.addObject("listPost", posts);

                 return mv;

    }
    @RequestMapping("redditpost")
    public String redditPost1(Model model,@RequestParam(defaultValue = "") String subReddit){
        Category category=categoryService.findCategoryByName(subReddit);
        List<Post> listPost=postService.findByCategory(category);
        List<Category> categoryList=categoryService.findAll();
        List<Post> latestPost= postService.latestPost();
        model.addAttribute("latestPost",latestPost);
        model.addAttribute("listPost",listPost);
        model.addAttribute("categoryList",categoryList);
        return "list-blog";
    }
    @RequestMapping("subraddit")
    public String allSubReddit(Model model){

//        ModelAndView modelAndView=new ModelAndView("allcatogaries.")
        List<Category> categoryList=categoryService.findAll();
        model.addAttribute("categoryList",categoryList);
        return "allcategories";
    }
    @GetMapping(value ="/new")
    public ModelAndView newBlogForm() {
        log.debug("Entering into new blog process");
        Post post=new Post();
        Category subReddit= new Category();
        ImagePost image=new ImagePost();
//        List<Category> allCategories= categoryService.listAll();
        ModelAndView mv= new ModelAndView("new-post");
        mv.addObject("category",subReddit);
        mv.addObject("post",post);
        mv.addObject("image",image);

//        mv.addObject("allCategories",allCategories);

//
        return  mv;
    }
    @RequestMapping("/uploadImg")
    public ModelAndView upload(){
        return new ModelAndView("uploadPic");
    }


//    @RequestMapping(value = "/saveimg",method = RequestMethod.POST)
//    public String saveimg(@RequestParam("file") MultipartFile file, Model model) throws IOException {
//        System.out.println("is it ??");
//        ImagePost dbFile = imagePostService.storeFile(file);
//
//        Iterable<ImagePost> imagePostList= imagePostService.findAll();
//
//        model.addAttribute("imageList",imagePostList);
//
//        return "/";
//    }

    @PostMapping("/new")
    public ModelAndView postSave(@ModelAttribute("category") Category category,@ModelAttribute("blog") Post post,@RequestParam("file") MultipartFile file,Model model) throws IOException, TwitterException {
        System.out.println("is it ??");
        String name=postService.findUser();

        Category cat=categoryService.findCategoryByName(category.getSubReddit());
        if (cat==null){
            categoryService.save(category);
            cat=categoryService.findCategoryByName(category.getSubReddit());
        }
        User user=userService.findUser(name);
            if (file.getName().length()>0) {

                imagePostService.storeFile(file, post);
                ImagePost image=imagePostService.getImageByPost(post);
//                categoryService.findCategory(category);

                post.setCategory(cat);
                post.setUser(user);
                post.setImageId(image.getId());
                postService.save(post);
            }
            else {
                        postService.savePost(post,user,cat);
            }




            return new ModelAndView("redirect:/");

    }

    @GetMapping(value ="/register")
    public ModelAndView newRegister(){
        log.debug("Entering in registering");
        User user= new User();
        ModelAndView mv= new ModelAndView("registration");
        mv.addObject("redditUser",user);
        return  mv;
    }

    @PostMapping(value ="/register")
    public ModelAndView newRegistration(@ModelAttribute("user") User redditUser){
        redditUser.setRole("user");
        ModelAndView mv= new ModelAndView();
        if(repo2.findByName(redditUser.getName())==null){
            userService.save(redditUser);
            mv.addObject("msg","Registration successful");
        }
        else {
            mv.addObject("msg","you are already registered");
        }
        mv.setViewName("login");
        return  mv;
    }
    @GetMapping(value ="/showcomment")
    public ModelAndView showComment(@RequestParam int id) {
        System.out.println(id);
        Post post= postService.get(id);
        ModelAndView mv= new ModelAndView("showComment");
        List<Comment> comments= commentService.find();
        System.out.println(comments.size());
        mv.addObject("comments",comments);
        mv.addObject("myPost",post);
        mv.addObject("post_id",id);

        return mv;

    }


    @GetMapping(value ="/addcomment")
    public ModelAndView addComment(@RequestParam int id) {
        ModelAndView mv= new ModelAndView("addComment");
        log.debug("Entering into new blog process");
        Comment comment=new Comment();
        Post post= postService.get(id);
        mv.addObject("post",post);



//        List<Category> allCategories= categoryService.listAll();

        mv.addObject("comment",comment);

//        mv.addObject("allCategories",allCategories);

//
        return  mv;
    }
    @GetMapping("/comment-save")
    public ModelAndView commentSave(@ModelAttribute("post") Post post,
                                    @ModelAttribute("comment") Comment comment) {

        String name=commentService.findUser();
        User user=userService.findUser(name);
        Post newPost=postService.get(post.getId());
        commentService.saveMyComment(comment,user,post.getId(),0);
        System.out.println(comment.getContent());
        System.out.println("22 ok");
        ModelAndView mv=new ModelAndView();
        Comment newCommment=new Comment();
        System.out.println("33 ok");
        mv.setViewName("show-post-by-id");
        List<Comment> allComments=commentService.find();
        mv.addObject("allComments",allComments);
        mv.addObject("comment",newCommment);
        mv.addObject("post",newPost);
        System.out.println("44 ok");

        return  mv;


    }
    @PostMapping("/reply-save")
    public ModelAndView replySave(@ModelAttribute("post") Post post,
                                    @ModelAttribute("comment") Comment comment,HttpServletRequest request,
                                  HttpServletResponse response) {
        System.out.println("fin: "+ request.getParameter("myhiddenvalue"));

        String ok= (String) request.getAttribute("commentId");
        System.out.println("this is :" +ok);
        String name=commentService.findUser();
        User user=userService.findUser(name);
        Post newPost=postService.get(post.getId());
        System.out.println("post:"+comment.getParentId());
        commentService.saveMyComment(comment,user,post.getId(),comment.getParentId());
        System.out.println("22 ok");
        ModelAndView mv=new ModelAndView();
        Comment newCommment=new Comment();
        System.out.println("33 ok");
        mv.setViewName("show-post-by-id");
        List<Comment> allComments=commentService.find();
        mv.addObject("allComments",allComments);
        mv.addObject("comment",newCommment);
        mv.addObject("post",newPost);
        System.out.println("44 ok");

        return  mv;


    }
//    @GetMapping("/upVote")
//    public Response upVote(@RequestParam String id){
//        System.out.println("ashish "+id);
//        int userId=voteService.findUser();
//        Post post=voteService.saveMyVote(1,userId,Integer.parseInt(id));
//        return new Response("DONE",post.getTotlevote());
//    }
//
//    @GetMapping("/downVote")
//    public Response downVote(@RequestParam int id){
//        int userId=voteService.findUser();
//        Post post=voteService.saveMyVote(-1,userId,id);
//        return new Response("DONE",post.getTotlevote());
//    }

    @GetMapping(value = "/view")
    public ModelAndView showById(@RequestParam int id){
        ModelAndView mv=new ModelAndView();
        Comment comment=new Comment();
        Post theBlog=  postService.get(id);
            mv.setViewName("show-post-by-id");
        List<Comment> allComments=commentService.find();
        mv.addObject("allComments",allComments);
        mv.addObject("comment",comment);
        mv.addObject("post",theBlog);

        return mv;
    }
    @RequestMapping("/ashish")
    @ResponseBody
    public List<String> ashish(@RequestParam(value="term", required = false, defaultValue="") String term){
        List<Category> nameList= categoryService.fetchName(term);
        List<String> stringList=new ArrayList<>();
        for(Category name:nameList){
            stringList.add(name.getSubReddit());
        }
        return stringList;
    }

    @RequestMapping("/filter")
    public ModelAndView search(@RequestParam(defaultValue = "") String search){

        List<Post> result = postService.search(search);
        Iterable<ImagePost> images= imagePostService.findAll();

        ModelAndView mav = new ModelAndView();
        List<Post> latestPost= postService.latestPost();
        List<Category> categories=categoryService.getAllCategory();

        mav.setViewName("search");
        List<Vote> allVote=voteService.listAll();
        List<Category> categoryList=categoryService.findAll();
        mav.addObject("categoryList",categoryList);
        mav.addObject("categories",categories);
        mav.addObject("latestPost",latestPost);
        mav.addObject("images",images);
        mav.addObject("listPost", result);

        mav.addObject("votes",allVote);

        log.debug("Exiting Allblogs list");
        System.out.println("Size:"+latestPost.size());
        return mav;
    }
    @RequestMapping(value ="/delete-confirm")
    public  ModelAndView deleteConfirm(@RequestParam int id){
        ModelAndView mav= new ModelAndView("confirm-delete");
        Post post = postService.get(id);

        mav.addObject("post", post);
        return mav;
    }
    @RequestMapping(value = "/delete")
    public ModelAndView deleteBlog(@RequestParam int id) {

            postService.delete(id);
            ModelAndView mv=new ModelAndView();
            mv.setViewName("redirect:/");
            return mv;

    }
//    @GetMapping(value ="/edit")
//    public ModelAndView edit(@RequestParam int id) {
//        log.debug("Entering into new blog process");
//        Post post=postService.get(id);
//        Category subReddit= postService.get(id).getCategory();
//        ImagePost image=postService.get(id).getImagePost();
////        List<Category> allCategories= categoryService.listAll();
//        ModelAndView mv= new ModelAndView("edit-post");
//        mv.addObject("category",subReddit);
//        mv.addObject("post",post);
//        mv.addObject("image",image);
//
////        mv.addObject("allCategories",allCategories);
//
////
//        return  mv;
//    }
//
//    @PostMapping("/edit-save")
//    public ModelAndView editSave(@ModelAttribute("category") Category category,@ModelAttribute("blog") Post post,@RequestParam("file") MultipartFile file) throws IOException, TwitterException {
//
//        String name=postService.findUser();
//        int id=post.getId();
//        postService.delete(id);
//        System.out.println(post.getId());
//        Category cat=categoryService.findCategoryByName(category.getSubReddit());
//        if (cat==null){
//            categoryService.save(category);
//            cat=categoryService.findCategoryByName(category.getSubReddit());
//        }
//        User user=userService.findUser(name);
//        if (file.getName().length()>0) {
//
//
////                categoryService.findCategory(category);
//            post.setId(id);
//            post.setCategory(cat);
//            post.setUser(user);
//            postService.save(post);
//            post=postService.get(id);
//            System.out.println("all ok");
//            imagePostService.storeFile(file, post);
//            ImagePost image=imagePostService.getImageByPost(post);
//            post.setImageId(image.getId());
//            postService.save(post);
//
//        }
//        else {
//            postService.savePost(post,user,cat);
//        }
//
//
//
//
//        return new ModelAndView("redirect:/");
//
//    }




    //    @RequestMapping(value = "/messages", method = RequestMethod.POST)
//    @MessageMapping("/newMessage")
//    @SendTo("/topic/newMessage")
//    public Comment save(Comment comment) {
//        Comment comment1 = new Comment(comment.getContent(),comment.getCreatedAt(),comment.getUser_id());
//        commentService.save(comment1);
//        List<Comment> allComment=commentService.find();
//        return new Comment(allComment.toString());
//    }
}
