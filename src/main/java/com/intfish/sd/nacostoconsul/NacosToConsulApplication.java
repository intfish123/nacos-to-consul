package com.intfish.sd.nacostoconsul;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class NacosToConsulApplication {

    public static void main(String[] args) {
        SpringApplication.run(NacosToConsulApplication.class, args);
    }

}
