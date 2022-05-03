package mybatis.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {  // 싱글톤(Singleton) 패턴으로 팩토리 생성 => 하나의 객체만 만들겠다.
		try {
			Reader reader 
				= Resources.getResourceAsReader("mybatis/config/mybatis-config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
