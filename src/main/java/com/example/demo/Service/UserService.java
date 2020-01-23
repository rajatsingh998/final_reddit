package com.example.demo.Service;

import com.example.demo.Model.User;
import com.example.demo.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service

public class UserService implements UserDetailsService {
    @Autowired
    UserRepository repo;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String user) throws UsernameNotFoundException {
        User userTable = repo.findByName(user);

        if (userTable == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return new UserPrincipal(userTable.getName(), userTable.getPassword(), userTable.getRole());
    }

    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        repo.save(user);
    }

    public User findUser(String sender) {
        return repo.findByName(sender);
    }

}
