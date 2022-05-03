package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {
	public static List<EmpVO> getTotal() {
		/*
		 * 이미 생성되어 있는 factory 객체를 이용하여 SqlSession을 얻어낸다.
		 * select 작업은 auto commit을 하지 않아도 되기 때문에
		 * openSession() 메소드 호출 시 true를 인자값으로 주지 않아도 된다.
		 */
		SqlSession ss = FactoryService.getFactory().openSession();
		List<EmpVO> list = ss.selectList("emp.total");
		ss.close();
		
		return list;
	}
}
