package com.yozo.common;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {

	// static 멤버 필드로 SQlSessionFactory type선언
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSEssionFactory() {
		String resource = "com/yozo/common/mybatis-config.xml";
		Reader reader = null;

		try {

			reader = Resources.getResourceAsReader(resource);
			// SqlSessionFactory 객체의 참조값을 얻어내서 멤버필드에 저장
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				reader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sqlSessionFactory;
	}
}
