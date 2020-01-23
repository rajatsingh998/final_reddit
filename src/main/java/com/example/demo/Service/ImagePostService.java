package com.example.demo.Service;

import com.example.demo.Model.ImagePost;
import com.example.demo.Model.Post;
import com.example.demo.MyFileNotFoundException;
import com.example.demo.Repository.ImagePostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.Optional;

@Service
@Transactional
public class ImagePostService {
    @Autowired
    ImagePostRepository imagePostJpaRepo;

    public ImagePost storeFile(MultipartFile file, Post post) throws IOException {
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());


            // Check if the file's name contains invalid characters


            ImagePost dbFile = new ImagePost(fileName, file.getContentType(), file.getBytes());
            dbFile.setPosts(post);

            return imagePostJpaRepo.save(dbFile);


    }

    public ImagePost getFile(String fileId) {
        return imagePostJpaRepo.findById(fileId).orElseThrow(()->new MyFileNotFoundException("File not found with id " + fileId));
    }

    public Iterable<ImagePost> findAll() {
            return imagePostJpaRepo.findAll();
    }

    public ImagePost getImageByPost(Post post) {
        return imagePostJpaRepo.findByPosts(post);
    }

}
