//package com.example.demo.Configuration;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.social.twitter.api.impl.TwitterTemplate;
//import twitter4j.Twitter;
//import twitter4j.TwitterFactory;
//import twitter4j.conf.ConfigurationBuilder;
//
//@Configuration
//public class TwitterConfig {
//    private String consumerKey="FlQKlXN19lvgYTmvlxq8tPyBl";
//
//    private String consumerSecret="MtagZlVDDzpFerXjnJrsuvEuHIYcI7CKztMA6xyxoNBTvkcwQu";
//
//    private String accessToken="3039755581-aiSL1tS1egnau7dle2jMW1rVXZPk3Pmg8eces7K";
//
//    private String accessTokenSecret="Pfz0BL4suR3R6Bdte98tMgnzvAxtxBC4kTa16S1JQOIMh";
//
//
//
//    @Bean
//    TwitterTemplate getTwtTemplate() {
//        return new TwitterTemplate(consumerKey, consumerSecret, accessToken, accessTokenSecret);
//    }
//}
