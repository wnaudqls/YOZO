package com.yozo.user.db;

import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resources;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {

	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource = "com/yozo/admin/db/config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
			
		} catch (IOException e) {
			System.out.println("sqlMapConfig error");
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		
		
		
		return sqlSessionFactory;
	}
	
	
}
