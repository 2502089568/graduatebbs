package com.zz.graduatebbs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.zz.graduatebbs.mapper")
@SpringBootApplication
public class GraduatebbsApplication {

	public static void main(String[] args) {
		SpringApplication.run(GraduatebbsApplication.class, args);
	}

}
